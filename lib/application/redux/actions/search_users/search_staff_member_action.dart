import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/searched_staff_members.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class SearchStaffMemberAction extends ReduxAction<AppState> {
  SearchStaffMemberAction({
    required this.client,
    required this.staffNumberQuery,
  });

  final IGraphQlClient client;
  String staffNumberQuery;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchStaffMemberFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateSearchUserResponseStateAction(
        searchUserResponses: <SearchUserResponse>[],
        errorSearchingUser: false,
        noUserFound: false,
        timeoutSearchingUser: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(searchStaffMemberFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': staffNumberQuery
    };

    final Response response =
        await client.query(searchStaffMemberQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchStaffErrorString,
          query: searchStaffMemberQuery,
          response: response,
          state: state,
          variables: variables,
        );
        throw UserException(getErrorMessage('fetching staff members'));
      }

      final SearchedStaffMembers staffMembersResponse =
          SearchedStaffMembers.fromJson(body['data'] as Map<String, dynamic>);

      if (staffMembersResponse.staffMembers == null) {
        dispatch(UpdateSearchUserResponseStateAction(noUserFound: true));
        return null;
      }
      dispatch(
        UpdateSearchUserResponseStateAction(
          searchUserResponses:
              staffMembersResponse.staffMembers ?? <SearchUserResponse>[],
        ),
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
