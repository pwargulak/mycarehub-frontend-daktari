import 'dart:async';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/fetch_program_facilities_action.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class AddFacilityToProgramAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;
  final String programId;
  final String facilityId;

  AddFacilityToProgramAction({
    required this.client,
    this.onFailure,
    this.onSuccess,
    required this.programId,
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
      'programID': programId,
      'facilityIDs': <dynamic>[facilityId],
    };

    final Response response =
        await client.query(addFacilityToProgramMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        onFailure?.call(getErrorMessage('adding the facility to program'));
        reportErrorToSentry(
          hint: addFacilityToProgramErrorString,
          query: addFacilityToProgramMutation,
          response: response,
          state: state,
          variables: variables,
        );
        return null;
      }

      final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
      if ((data['addFacilityToProgram'] as bool?) ?? false) {
        dispatch(
          FetchProgramFacilitiesAction(client: client, programId: programId),
        );
        onSuccess?.call();
      }
    } else {
      onFailure?.call(getErrorMessage('adding the facility to program'));
      reportErrorToSentry(
        hint: addFacilityToProgramErrorString,
        query: addFacilityToProgramMutation,
        response: response,
        state: state,
        variables: variables,
      );
    }
    return null;
  }
}
