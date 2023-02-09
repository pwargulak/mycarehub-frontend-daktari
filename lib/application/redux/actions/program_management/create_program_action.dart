import 'dart:async';

import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/program_management/create_program_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class CreateProgramAction extends ReduxAction<AppState> {
  final CreateProgramPayload createProgramPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  CreateProgramAction({
    required this.createProgramPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(createProgramFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createProgramFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = createProgramPayload.toJson();
    final Response response = await client.query(
      createProgramMutation,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: createProgramErrorString,
          query: createProgramMutation,
          response: response,
          state: state,
          variables: <String, dynamic>{'input': payload},
        );

        throw const UserException(somethingWentWrongText);
      }
      this.onSuccess();
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
