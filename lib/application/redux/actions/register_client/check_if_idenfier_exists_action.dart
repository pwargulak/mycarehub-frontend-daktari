import 'dart:async';
import 'dart:convert';

import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class CheckIfIdentifierExistsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final IdentifierType identifierType;
  final String identifierValue;

  CheckIfIdentifierExistsAction({
    required this.client,
    required this.identifierType,
    required this.identifierValue,
  });

  @override
  void before() {
    super.before();
    dispatch(
      BatchUpdateMiscStateAction(userExists: false),
    );
    dispatch(WaitAction<AppState>.add(checkIfIdentifierExistsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(checkIfIdentifierExistsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'identifierType': identifierType.name,
      'identifierValue': identifierValue,
    };

    final Response response = await client.query(
      checkIdentifierExistsQuery,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final Map<String, dynamic> responseMap =
          json.decode(response.body) as Map<String, dynamic>;

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: checkIdentifierErrorString,
          query: checkIdentifierExistsQuery,
          response: response,
          state: state,
          variables: variables,
        );
        return null;
      }
      final Map<String, dynamic>? data =
          responseMap['data'] as Map<String, dynamic>?;
      final bool? identifierExists = data?['checkIdentifierExists'] as bool?;

      if (identifierExists ?? false) {
        dispatch(BatchUpdateMiscStateAction(userExists: identifierExists));
      }

      await AnalyticsService().logEvent(
        name: checkIfIdentifierExists,
        eventType: AnalyticsEventType.INTERACTION,
      );
    }

    return null;
  }
}
