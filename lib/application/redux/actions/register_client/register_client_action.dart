import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/register_client_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class RegisterClientAction extends ReduxAction<AppState> {
  final RegisterClientPayload registerClientPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  RegisterClientAction({
    required this.registerClientPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(registerClientFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(registerClientFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = registerClientPayload.toJson();

    final Response response = await client.query(
      registerClientMutation,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains(identifierString) &&
            errors.contains(alreadyExistsString)) {
          throw UserException(capitalizeFirst(clientCccExists));
        } else if (errors.contains('username') &&
            errors.contains(alreadyExistsString)) {
          throw const UserException(clientUsernameExists);
        }

        reportErrorToSentry(
          hint: registerClientErrorString,
          query: registerClientMutation,
          response: response,
          state: state,
          variables: payload,
        );

        throw const UserException(somethingWentWrongText);
      }

      this.onSuccess();
      await AnalyticsService().logEvent(
        name: registerClient,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'cccNumber': registerClientPayload.cccNumber,
          'clientName': registerClientPayload.clientName,
          'clientTypes': registerClientPayload.clientTypes.toString(),
        },
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
