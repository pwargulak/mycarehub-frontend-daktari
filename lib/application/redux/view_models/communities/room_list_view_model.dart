import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomListViewModel extends Vm {
  RoomListViewModel({
    required this.joinedRooms,
    this.wait,
    this.displayName,
    this.invitedRooms,
  }) : super(
          equals: <Object?>[
            joinedRooms,
            wait,
            displayName,
            invitedRooms,
            joinedRooms,
          ],
        );

  factory RoomListViewModel.fromStore(Store<AppState> store) {
    return RoomListViewModel(
      wait: store.state.wait,
      displayName: store.state.chatState?.userProfile?.userID,
      joinedRooms: store.state.chatState?.syncResponse?.rooms?.joinedRooms,
      invitedRooms: store.state.chatState?.syncResponse?.rooms?.invitedRooms,
    );
  }

  final Map<String, Room>? invitedRooms;
  final Map<String, Room>? joinedRooms;

  final Wait? wait;
  final String? displayName;
}
