import 'dart:async';

import 'package:prohealth360_daktari/application/redux/actions/facilities/fetch_client_facilities_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AddFacilityToClientProfileAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;
  final String clientId;
  final String facilityId;

  AddFacilityToClientProfileAction({
    required this.client,
    this.onFailure,
    this.onSuccess,
    required this.clientId,
    required this.facilityId,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(addFacilityFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(addFacilityFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call(noInternetConnection);
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientId,
      'facilities': <dynamic>[facilityId],
    };

    final Response response =
        await client.query(addFacilitiesToClientProfileMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors, cause: addFacilitiesToClientProfileMutation),
        );

        onFailure?.call(getErrorMessage('adding the facility to client'));
        return null;
      }

      final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
      if ((data['addFacilitiesToClientProfile'] as bool?) ?? false) {
        dispatch(
          FetchClientFacilitiesAction(client: client, userId: clientId),
        );
        onSuccess?.call();
      }
    } else {
      onFailure?.call(getErrorMessage('adding the facility to client'));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: addFacilitiesToClientProfileMutation,
        ),
      );
    }
    return null;
  }
}
