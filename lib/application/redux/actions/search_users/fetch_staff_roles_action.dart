import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/update_search_user_response_state.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/roles_list.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchStaffRolesAction extends ReduxAction<AppState> {
  FetchStaffRolesAction({
    required this.userID,
    required this.client,
    required this.onFailure,
  });

  final IGraphQlClient client;
  final String userID;
  final void Function()? onFailure;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getUserRolesFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(getUserRolesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
    };
    final Response response = await client.query(getUserRolesQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('getting user roles'));
      }

      if (body['data'] != null &&
          body['data']['getUserRoles'] != null &&
          body['data']['getUserRoles'] is List &&
          (body['data']['getUserRoles'] as List<dynamic>).isNotEmpty) {
        final RolesList roles =
            RolesList.fromJson(body['data'] as Map<String, dynamic>);

        final SearchUserResponse newUserResponse = state
            .miscState!.searchUserResponseState!.selectedSearchUserResponse!
            .copyWith(rolesList: roles);

        dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse: newUserResponse,
          ),
        );
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}