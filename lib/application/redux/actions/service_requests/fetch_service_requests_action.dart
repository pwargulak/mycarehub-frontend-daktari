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
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchServiceRequestsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final RequestStatus serviceRequestStatus;
  final ServiceRequestType? serviceRequestType;
  final Flavour flavour;

  FetchServiceRequestsAction({
    required this.client,
    required this.serviceRequestStatus,
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
    final String facilityID = state.staffState?.defaultFacility ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'status': serviceRequestStatus.name,
      'facilityID': facilityID,
      'type': serviceRequestType?.name,
      'flavour': flavour.name,
    };

    final Response response = await client.query(
      getServiceRequestsQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchServiceRequestsErrorString,
        query: getServiceRequestsQuery,
        response: response,
        state: state,
        variables: variables,
      );
      dispatch(
        UpdateServiceRequestsStateAction(
          errorFetchingPendingServiceRequests: true,
        ),
      );
      return null;
    }

    final ServiceRequestResponse serviceRequestResponse =
        ServiceRequestResponse.fromJson(
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
