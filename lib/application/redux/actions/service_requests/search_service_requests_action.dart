import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/search_service_request_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class SearchServiceRequestsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String searchTerm;
  final ServiceRequestType? serviceRequestType;
  final Flavour flavour;

  SearchServiceRequestsAction({
    required this.client,
    required this.searchTerm,
    required this.flavour,
    this.serviceRequestType,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(
        errorFetchingPendingServiceRequests: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchServiceRequestFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID =
        state.userProfileState?.userProfile?.defaultFacility?.id ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'searchTerm': searchTerm,
      'facilityID': facilityID,
      'requestType': serviceRequestType?.name,
      'flavour': flavour.name,
    };

    final Response response = await client.query(
      searchServiceRequestsQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: searchServiceRequestErrorString,
        query: searchServiceRequestsQuery,
        response: response,
        state: state,
        variables: variables,
      );

      throw UserException(getErrorMessage('searching'));
    }

    final SearchServiceRequestResponse serviceRequestResponse =
        SearchServiceRequestResponse.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    if (serviceRequestType == ServiceRequestType.STAFF_PIN_RESET) {
      dispatch(
        UpdateServiceRequestsStateAction(
          staffServiceRequests:
              serviceRequestResponse.serviceRequests ?? <ServiceRequest>[],
        ),
      );
    } else {
      dispatch(
        UpdateServiceRequestsStateAction(
          clientServiceRequests:
              serviceRequestResponse.serviceRequests ?? <ServiceRequest>[],
        ),
      );
    }

    return state;
  }
}
