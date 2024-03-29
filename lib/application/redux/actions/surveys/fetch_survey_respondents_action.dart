import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_response_state.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
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
    dispatch(WaitAction<AppState>.add(fetchSurveyRespondentsFlag));
    dispatch(UpdateSurveyRespondentsStateAction(errorOccurred: false));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSurveyRespondentsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'projectID': projectID,
      'formID': formID,
      'paginationInput': <String, dynamic>{
        'limit': 10,
        'currentPage': 1,
      }
    };

    final Response response = await client.query(
      listSurveyRespondentsQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: listSurveyRespondentsErrorString,
        query: listSurveyRespondentsQuery,
        response: response,
        state: state,
        variables: variables,
      );

      dispatch(UpdateSurveyRespondentsStateAction(errorOccurred: true));
      return state;
    }
    final SurveyState surveyState = SurveyState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<SurveyRespondent?>? respondents =
        surveyState.surveyRespondentsState?.surveyRespondents;

    dispatch(
      UpdateSurveyRespondentsStateAction(surveyRespondents: respondents),
    );

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
