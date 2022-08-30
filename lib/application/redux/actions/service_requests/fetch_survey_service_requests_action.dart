import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_survey_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchSurveyServiceRequestsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchSurveyServiceRequestsAction({
    required this.client,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchSurveysFlag));
    dispatch(
      UpdateSurveyServiceRequestsStateAction(errorFetchingSurveys: false),
    );
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchSurveysFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String? facilityID = state.staffState?.defaultFacility;
    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityID
    };

    final Response response = await client.query(
      getSurveyWithServiceRequestQuery,
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
          'query': getSurveyWithServiceRequestQuery,
          'response': response.body,
        },
      );
      dispatch(
        UpdateSurveyServiceRequestsStateAction(errorFetchingSurveys: true),
      );
      return state;
    }

    final SurveyServiceRequestState surveyServiceRequestState =
        SurveyServiceRequestState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<SurveyServiceRequestItem?>? surveys =
        surveyServiceRequestState.surveys;

    dispatch(UpdateSurveyServiceRequestsStateAction(surveys: surveys));

    return state;
  }
}
