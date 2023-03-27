import 'dart:async';

import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchAvailableFacilityScreeningToolsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchAvailableFacilityScreeningToolsAction({
    required this.client,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(
        errorFetchingPendingServiceRequests: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableScreeningToolsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID =
        state.userProfileState?.userProfile?.defaultFacility?.id ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID,
      'pagination': <String, dynamic>{
        'limit': 20,
        'currentPage': 1,
      },
    };
    final Response response = await client.query(
      getAvailableFacilityScreeningToolsQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchAvailableScreeningToolsErrorString,
        query: getAvailableFacilityScreeningToolsQuery,
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
    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;
    if ((data?['getFacilityRespondedScreeningTools']
            as Map<String, dynamic>?) !=
        null) {
      final Map<String, dynamic> screeningToolData =
          data!['getFacilityRespondedScreeningTools'] as Map<String, dynamic>;

      final List<ScreeningTool> screeningToolsList = <ScreeningTool>[];

      for (final dynamic toolJSON
          in screeningToolData['screeningTools'] as List<dynamic>) {
        screeningToolsList.add(
          ScreeningTool.fromJson(toolJSON as Map<String, dynamic>),
        );
      }

      dispatch(
        UpdateScreeningToolsStateAction(availableTools: screeningToolsList),
      );
    } else {
      dispatch(
        UpdateServiceRequestsStateAction(
          errorFetchingPendingServiceRequests: true,
        ),
      );
    }

    return state;
  }
}
