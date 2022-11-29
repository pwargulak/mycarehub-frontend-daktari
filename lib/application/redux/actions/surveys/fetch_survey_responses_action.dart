import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchSurveyResponsesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final int projectID;
  final String formID;
  final String submitterID;

  FetchSurveyResponsesAction({
    required this.client,
    required this.projectID,
    required this.formID,
    required this.submitterID,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSurveyResponsesFlag));

    dispatch(UpdateSurveyStateAction(errorFetchingSurveys: false));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSurveyResponsesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'projectID': projectID,
        'formID': formID,
        'submitterID': submitterID,
      }
    };

    final Response response = await client.query(
      surveyResponseQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchSurveyResponsesErrorString,
        query: surveyResponseQuery,
        response: response,
        state: state,
        variables: variables,
      );
      dispatch(UpdateSurveyStateAction(errorFetchingSurveys: true));
      return state;
    }

    final SurveyState surveyState = SurveyState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<SurveyResponse>? surveyResponses = surveyState.surveyResponses;

    dispatch(UpdateSurveyStateAction(surveyResponses: surveyResponses));

    return state;
  }
}
