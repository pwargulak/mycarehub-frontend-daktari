import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/search_user_response_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';

class UpdateSearchUserResponseStateAction extends ReduxAction<AppState> {
  UpdateSearchUserResponseStateAction({
    this.searchUserResponses,
    this.errorSearchingUser,
    this.timeoutSearchingUser,
    this.noUserFound,
    this.selectedSearchUserResponse,
    this.selectedUsers,
  });

  final bool? errorSearchingUser;
  final bool? timeoutSearchingUser;
  final bool? noUserFound;
  final List<SearchUserResponse?>? searchUserResponses;
  final List<SearchUserResponse?>? selectedUsers;
  final SearchUserResponse? selectedSearchUserResponse;

  @override
  AppState reduce() {
    final SearchUserResponseState newSearchUserResponseState =
        SearchUserResponseState(
      searchUserResponses: searchUserResponses ??
          state.miscState?.searchUserResponseState?.searchUserResponses,
      errorSearchingUser: errorSearchingUser ??
          state.miscState?.searchUserResponseState?.errorSearchingUser,
      timeoutSearchingUser: timeoutSearchingUser ??
          state.miscState?.searchUserResponseState?.timeoutSearchingUser,
      noUserFound:
          noUserFound ?? state.miscState?.searchUserResponseState?.noUserFound,
      selectedSearchUserResponse: selectedSearchUserResponse ??
          state.miscState?.searchUserResponseState?.selectedSearchUserResponse,
      selectedUsers: selectedUsers ??
          state.miscState?.searchUserResponseState?.selectedUsers,
    );
    final AppState newState = state.copyWith(
      miscState: state.miscState
          ?.copyWith(searchUserResponseState: newSearchUserResponseState),
    );

    return newState;
  }
}
