import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomInfoViewModel extends Vm {
  RoomInfoViewModel({
    required this.groupInfoMembers,
    this.wait,
    required this.authUserID,
  }) : super(equals: <Object?>[groupInfoMembers, wait, authUserID]);

  factory RoomInfoViewModel.fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return RoomInfoViewModel(
      wait: state.wait,
      groupInfoMembers: state.chatState?.groupInfoMembers,
      authUserID: state.chatState?.userProfile?.userID ?? UNKNOWN,
    );
  }

  final List<RoomUser>? groupInfoMembers;

  /// User ID of the currently signed in user
  final String authUserID;
  final Wait? wait;
}
