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
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/client_caregivers_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchClientCaregiversAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String clientId;

  FetchClientCaregiversAction({
    required this.client,
    this.onFailure,
    required this.clientId,
  });

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchClientCaregiversFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(
      UpdateStaffProfileAction(
        clientCaregivers: <Caregiver>[],
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchClientCaregiversFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientId,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      },
    };

    /// fetch the data from the api
    final Response response = await client.query(
      listClientsCaregiversQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> payLoad = client.toMap(response);

      final String? error = parseError(payLoad);

      if (error != null) {
        onFailure?.call(getErrorMessage("this client's caregivers"));
        reportErrorToSentry(
          hint: fetchClientCaregiversErrorString,
          query: listClientsCaregiversQuery,
          response: response,
          state: state,
          variables: variables,
        );
        return null;
      }

      final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;

      final ClientCaregiversResponse clientCaregiversResponse =
          ClientCaregiversResponse.fromJson(data);

      final List<Caregiver?>? clientCaregivers =
          clientCaregiversResponse.caregiversList?.caregivers;

      dispatch(UpdateStaffProfileAction(clientCaregivers: clientCaregivers));
    } else {
      onFailure?.call(getErrorMessage("this client's caregivers"));
      reportErrorToSentry(
        hint: fetchClientCaregiversErrorString,
        query: listClientsCaregiversQuery,
        response: response,
        state: state,
        variables: variables,
      );
    }

    return state;
  }
}
