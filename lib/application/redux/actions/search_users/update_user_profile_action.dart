import 'dart:async';
import 'dart:convert';

import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    required this.cccNumber,
    required this.phoneNumber,
    required this.userID,
    this.onError,
    required this.client,
    required this.onSuccess,
  });

  final String phoneNumber;
  final String cccNumber;
  final String userID;
  final void Function({String message})? onError;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(updateUserProfileFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(updateUserProfileFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'phoneNumber': phoneNumber,
      'cccNumber': cccNumber,
      'flavour': Flavour.consumer.name,
    };
    final Response response =
        await client.query(updateProfileMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: updateUserProfileErrorString,
          query: updateProfileMutation,
          response: response,
          state: state,
          variables: variables,
        );

        onError?.call(
          message: getErrorMessage("updating user's profile information"),
        );
        return null;
      }

      final Map<String, dynamic> responseMap =
          json.decode(response.body) as Map<String, dynamic>;

      final Map<String, dynamic>? data =
          responseMap['data'] as Map<String, dynamic>?;
      if (data?['updateProfile'] != null && data?['updateProfile'] == true) {
        onSuccess.call();

        await AnalyticsService().logEvent(
          name: updateUserProfileInformationEvent,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'userID': userID,
            'phoneNumber': phoneNumber,
            'cccNumber': cccNumber,
            'flavour': Flavour.consumer.name,
          },
        );
      } else {
        onError?.call(
          message: getErrorMessage("updating user's profile information"),
        );
      }
    } else {
      onError?.call(
        message: getErrorMessage("updating user's profile information"),
      );
      reportErrorToSentry(
        hint: updateUserProfileErrorString,
        query: updateProfileMutation,
        response: response,
        state: state,
        variables: variables,
      );
    }

    return state;
  }
}
