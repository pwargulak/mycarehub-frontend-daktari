import 'dart:async';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/list_user_programs_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchUserProgramsAction extends ReduxAction<AppState> {
  FetchUserProgramsAction({
    required this.client,
    this.onFailure,
    required this.userId,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String userId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchUserProgramsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(UpdateProgramsStateAction(userPrograms: <Program>[]));
    dispatch(WaitAction<AppState>.add(fetchUserProgramsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userId,
      'flavour': Flavour.pro.name
    };

    final Response response =
        await client.query(listUserProgramsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchUserProgramsErrorString,
          query: listUserProgramsQuery,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('fetching your programs'));
        return null;
      }
      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final ListUserProgramsResponse listUserProgramsResponse =
          ListUserProgramsResponse.fromJson(
        data?['listUserPrograms'] as Map<String, dynamic>,
      );
      final List<Program> userPrograms =
          listUserProgramsResponse.programs ?? <Program>[];

      dispatch(
        UpdateProgramsStateAction(
          userPrograms: userPrograms,
        ),
      );
    } else {
      onFailure?.call(getErrorMessage('fetching your programs'));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: listUserProgramsQuery,
        ),
      );
    }
    return state;
  }
}
