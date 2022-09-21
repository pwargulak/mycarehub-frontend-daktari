import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/register_caregiver_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class RegisterCaregiverAction extends ReduxAction<AppState> {
  final RegisterCaregiverPayload registerCaregiverPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  RegisterCaregiverAction({
    required this.registerCaregiverPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(registerCaregiverFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(registerCaregiverFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = registerCaregiverPayload.toJson();

    final Response response = await client.query(
      registerCaregiverMutation,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));

        throw const UserException(somethingWentWrongText);
      }

      this.onSuccess();
      await AnalyticsService().logEvent(
        name: registerCaregiver,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'name': registerCaregiverPayload.name,
          'phoneNumber': registerCaregiverPayload.phoneNumber,
        },
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
