import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomPageViewModel extends Vm {
  RoomPageViewModel({
    required this.joinedRooms,
    required this.invitedRooms,
    this.wait,
  }) : super(equals: <Object?>[invitedRooms, joinedRooms, wait]);

  factory RoomPageViewModel.fromStore(Store<AppState> store) {
    return RoomPageViewModel(
      wait: store.state.wait,
      invitedRooms: store.state.chatState?.syncResponse?.rooms?.invitedRooms,
      joinedRooms: store.state.chatState?.syncResponse?.rooms?.joinedRooms,
    );
  }

  final Wait? wait;

  final Map<String, Room>? invitedRooms;
  final Map<String, Room>? joinedRooms;
}
