import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class SendSurveysAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;
  final void Function(String?)? onError;
  final VoidCallback? onSuccess;

  SendSurveysAction({
    required this.client,
    required this.variables,
    this.onError,
    this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(sendSurveysFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(sendSurveysFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await client.query(
      sendClientSurveyLinksMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call(error);

      reportErrorToSentry(
        hint: sendSurveysErrorString,
        query: sendClientSurveyLinksMutation,
        response: response,
        state: state,
        variables: variables,
      );

      return null;
    }

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;
    if (data?['sendClientSurveyLinks'] == true) {
      onSuccess?.call();
      return state;
    }
    onError?.call(getErrorMessage('sending surveys'));
    return null;
  }
}
