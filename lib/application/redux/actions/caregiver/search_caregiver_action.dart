import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/update_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/search_caregiver_response_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SearchCaregiversAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String searchTerm;

  SearchCaregiversAction({
    required this.client,
    this.onFailure,
    required this.searchTerm,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateCaregiverAction(
        errorFetchingCaregivers: false,
        noCaregiversFound: false,
        caregivers: <Caregiver>[],
      ),
    );
    dispatch(WaitAction<AppState>.add(searchCaregiverFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchCaregiverFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call('connection failure');
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': searchTerm,
    };

    final Response response =
        await client.query(searchCaregiverUserQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        dispatch(UpdateCaregiverAction(errorFetchingCaregivers: true));

        throw UserException(getErrorMessage('fetching caregivers'));
      }

      final SearchCaregiverResponseState caregiverResponseState =
          SearchCaregiverResponseState.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      if (caregiverResponseState.caregivers?.isEmpty ?? false) {
        dispatch(
          UpdateCaregiverAction(
            noCaregiversFound: true,
            caregivers: <Caregiver>[],
          ),
        );
      } else {
        dispatch(
          UpdateCaregiverAction(caregivers: caregiverResponseState.caregivers),
        );
      }
    } else {
      Sentry.captureException(
        somethingWentWrongText,
        hint: <String, dynamic>{
          'query': searchCaregiverUserQuery,
          'variables': variables,
          'response': response
        },
      );
      dispatch(UpdateCaregiverAction(errorFetchingCaregivers: true));
      throw UserException(processedResponse.message);
    }
    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      Sentry.captureException(error);
      return error;
    }

    return null;
  }
}
