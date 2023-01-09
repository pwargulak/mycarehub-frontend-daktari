import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_survey_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_respondents_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchSurveyRespondentsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final int projectID;
  final String formID;

  FetchSurveyRespondentsAction({
    required this.client,
    required this.projectID,
    required this.formID,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSurveyResponsesFlag));

    dispatch(
      UpdateSurveyServiceRequestsStateAction(errorFetchingSurveys: false),
    );
    dispatch(
      UpdateSurveyServiceRequestsStateAction(
        surveyServiceRequestRespondentsState:
            SurveyServiceRequestRespondentsState.initial(),
      ),
    );
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSurveyResponsesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String? facilityID =
        state.userProfileState?.userProfile?.defaultFacility;
    final Map<String, dynamic> variables = <String, dynamic>{
      'projectID': projectID,
      'formID': formID,
      'facilityID': facilityID,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      }
    };

    final Response response = await client.query(
      getSurveyServiceRequestUserQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(
        error,
        hint: <String, dynamic>{
          'variables': variables,
          'query': getSurveyServiceRequestUserQuery,
          'response': response.body,
        },
      );
      dispatch(
        UpdateSurveyServiceRequestsStateAction(
          errorFetchingSurveys: true,
        ),
      );
      return state;
    }

    final SurveyServiceRequestState surveyServiceRequestState =
        SurveyServiceRequestState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateSurveyServiceRequestsStateAction(
        surveyServiceRequestRespondentsState:
            surveyServiceRequestState.surveyServiceRequestRespondentsState,
      ),
    );

    return state;
  }
}
