import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class JoinRoomAction extends ReduxAction<AppState> {
  JoinRoomAction({required this.roomID, required this.client, this.onSuccess});

  final String roomID;
  final Function()? onSuccess;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(joinRoomFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(joinRoomFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> decodedResponse =
        await ChatAPI.joinRoom(client: client, roomID: roomID);
    if (decodedResponse['errcode'] != null) {
      // Handle errors here
      return null;
    }

    if (decodedResponse.containsKey('room_id')) {
      // Find the room by its ID in state and modify it
      final Map<String, Room>? invitedRoomsFromState =
          state.chatState?.syncResponse?.rooms?.invitedRooms;
      if (invitedRoomsFromState?.containsKey(roomID) ?? false) {
        final Room? newRoom =
            invitedRoomsFromState![roomID]?.copyWith.call(invite: false);

        if (newRoom != null) {
          invitedRoomsFromState.addAll(<String, Room>{roomID: newRoom});

          final AppState? newState = state
              .copyWith.chatState?.syncResponse?.rooms
              ?.call(invitedRooms: invitedRoomsFromState);

          if (onSuccess != null) onSuccess?.call();

          return newState;
        }
      }
    } else {
      return null;
    }
    return null;
  }
}
