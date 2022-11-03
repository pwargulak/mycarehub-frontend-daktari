import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchCaregiverManagedClientsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String caregiverId;

  FetchCaregiverManagedClientsAction({
    required this.client,
    this.onFailure,
    required this.caregiverId,
  });

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchManagedClientsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(
      UpdateStaffProfileAction(
        managedClients: <ManagedClient>[],
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchManagedClientsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'caregiverID': caregiverId,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      },
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getCaregiverManagedClientsQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> payLoad = client.toMap(response);
      final String? error = parseError(payLoad);

      if (error != null) {
        onFailure?.call(getErrorMessage('managed caregivers'));
        reportErrorToSentry(
          hint: fetchManagedErrorString,
          query: getCaregiverManagedClientsQuery,
          response: response,
          state: state,
          variables: variables,
        );
        return null;
      }

      final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;

      final ManagedClientsResponse managedClientsResponse =
          ManagedClientsResponse.fromJson(data);

      final List<ManagedClient>? managedClients =
          managedClientsResponse.managedClients?.clients;

      dispatch(UpdateStaffProfileAction(managedClients: managedClients));
    } else {
      onFailure?.call(getErrorMessage('managed caregivers'));
      reportErrorToSentry(
        hint: fetchManagedErrorString,
        query: getCaregiverManagedClientsQuery,
        response: response,
        state: state,
        variables: variables,
      );
    }

    return state;
  }
}