import 'dart:async';

import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_question_response.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchScreeningToolResponsesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final ScreeningToolsType toolsType;
  final String screeningToolRespondentId;
  final VoidCallback? onFailure;

  FetchScreeningToolResponsesAction({
    required this.toolsType,
    required this.client,
    required this.screeningToolRespondentId,
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchScreeningToolResponsesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchScreeningToolResponsesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'id': screeningToolRespondentId
    };
    final Response response = await client.query(
      getScreeningToolServiceRequestResponsesQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      reportErrorToSentry(
        hint: fetchScreeningToolsResponseErrorString,
        query: getScreeningToolServiceRequestResponsesQuery,
        response: response,
        state: state,
        variables: variables,
      );

      onFailure?.call();

      return null;
    }
    final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;
    final Map<String, dynamic> responsesData =
        data['getScreeningToolResponse'] as Map<String, dynamic>;

    final ScreeningToolQuestionResponses screeningToolQuestionResponses =
        ScreeningToolQuestionResponses.fromJson(responsesData);

    store.dispatch(
      UpdateScreeningToolsStateAction(
        screeningToolQuestionResponses: screeningToolQuestionResponses,
      ),
    );

    return state;
  }
}
