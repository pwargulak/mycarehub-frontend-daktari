import 'dart:async';

import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/assigned_caregiver.dart';
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

class AssignCaregiverAction extends ReduxAction<AppState> {
  final AssignedCaregiver assignedCaregiver;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  AssignCaregiverAction({
    required this.assignedCaregiver,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(assignCaregiverFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(assignCaregiverFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload = assignedCaregiver.toJson();
    final Response response = await client.query(
      assignCaregiverMutation,
      <String, dynamic>{'input': payload},
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: assignCaregiverErrorString,
          query: assignCaregiverMutation,
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
