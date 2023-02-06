import 'dart:async';

import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/list_user_programs_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class SearchProgramsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String searchTerm;

  SearchProgramsAction({
    required this.client,
    this.onFailure,
    required this.searchTerm,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateProgramsStateAction(programs: <Program>[]));
    dispatch(WaitAction<AppState>.add(fetchProgramsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchProgramsFlag));
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
        await client.query(searchProgramsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchProgramsErrorString,
          query: searchProgramsQuery,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        throw UserException(getErrorMessage('fetching programs'));
      }

      final ListUserProgramsResponse listUserProgramsResponse =
          ListUserProgramsResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );
      final List<Program> programs =
          listUserProgramsResponse.programs ?? <Program>[];

      dispatch(
        UpdateProgramsStateAction(
          programs: programs,
        ),
      );
    } else {
      throw UserException(processedResponse.message);
    }
    return null;
  }
}
