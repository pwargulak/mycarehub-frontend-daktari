import 'dart:async';

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
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchAssessmentRespondentsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String screeningToolID;

  FetchAssessmentRespondentsAction({
    required this.client,
    required this.screeningToolID,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(
        errorFetchingPendingServiceRequests: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchAssessmentResponsesByToolFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAssessmentResponsesByToolFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID =
        state.userProfileState?.userProfile?.defaultFacility?.id ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID,
      'screeningToolID': screeningToolID,
      'pagination': <String, dynamic>{'limit': 10, 'currentPage': 1}
    };
    final Response response = await client.query(
      getAssessmentResponsesByToolTypeQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchAssessmentResponsesErrorString,
        query: getAssessmentResponsesByToolTypeQuery,
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
    final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;
    final Map<String, dynamic> respondentsData =
        data['getScreeningToolRespondents'] as Map<String, dynamic>;
    final List<ScreeningToolRespondent> screeningToolRespondents =
        <ScreeningToolRespondent>[];

    for (final dynamic respondentJSON
        in respondentsData['screeningToolRespondents'] as List<dynamic>) {
      screeningToolRespondents.add(
        ScreeningToolRespondent.fromJson(
          respondentJSON as Map<String, dynamic>,
        ),
      );
    }

    dispatch(
      UpdateScreeningToolsStateAction(
        screeningToolRespondents: screeningToolRespondents,
      ),
    );

    return state;
  }
}
