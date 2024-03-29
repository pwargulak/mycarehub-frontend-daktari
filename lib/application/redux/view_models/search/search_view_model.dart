import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';

class SearchViewModel extends Vm {
  final Wait wait;
  final bool? errorFetchingSearchUserResponse;
  final bool? timeoutFetchingSearchUserResponse;
  final bool? noUserFound;
  final List<SearchUserResponse?>? searchUserResponses;
  final List<SearchUserResponse?>? selectedUsers;
  final SearchUserResponse? selectedSearchUserResponse;
  final List<HealthDiaryEntry?>? sharedDiaryEntries;

  SearchViewModel({
    required this.wait,
    this.searchUserResponses,
    this.errorFetchingSearchUserResponse,
    this.timeoutFetchingSearchUserResponse,
    this.noUserFound,
    this.selectedSearchUserResponse,
    this.sharedDiaryEntries,
    this.selectedUsers,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingSearchUserResponse,
            timeoutFetchingSearchUserResponse,
            searchUserResponses,
            selectedSearchUserResponse,
            noUserFound,
            sharedDiaryEntries,
            selectedUsers
          ],
        );

  factory SearchViewModel.fromStore(Store<AppState> store) {
    return SearchViewModel(
      wait: store.state.wait!,
      errorFetchingSearchUserResponse:
          store.state.miscState?.searchUserResponseState?.errorSearchingUser,
      timeoutFetchingSearchUserResponse:
          store.state.miscState?.searchUserResponseState?.timeoutSearchingUser,
      noUserFound: store.state.miscState?.searchUserResponseState?.noUserFound,
      searchUserResponses:
          store.state.miscState?.searchUserResponseState?.searchUserResponses,
      selectedSearchUserResponse: store
          .state.miscState?.searchUserResponseState?.selectedSearchUserResponse,
      sharedDiaryEntries:
          store.state.userProfileState?.userProfile?.clientSharedDiaryEntries,
      selectedUsers:
          store.state.miscState?.searchUserResponseState?.selectedUsers,
    );
  }
}
