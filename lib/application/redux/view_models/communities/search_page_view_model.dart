import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/user.dart';

class SearchPageViewModel extends Vm {
  SearchPageViewModel({required this.searchMemberResults, this.wait})
      : super(equals: <Object?>[searchMemberResults, wait]);

  factory SearchPageViewModel.fromStore(Store<AppState> store) {
    return SearchPageViewModel(
      wait: store.state.wait,
      searchMemberResults: store.state.chatState?.searchMemberResults,
    );
  }

  final List<User>? searchMemberResults;
  final Wait? wait;
}
