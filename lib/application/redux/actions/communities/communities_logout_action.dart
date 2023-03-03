import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class CommunitiesLogoutAction extends ReduxAction<AppState> {
  CommunitiesLogoutAction({this.onSuccess});

  final Function()? onSuccess;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(communitiesSignOutFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(communitiesSignOutFlag));
  }

  @override
  Future<AppState?> reduce() async {
    onSuccess?.call();

    state.chatState?.syncState?.syncObserver?.cancel();

    return AppState.initial();
  }
}
