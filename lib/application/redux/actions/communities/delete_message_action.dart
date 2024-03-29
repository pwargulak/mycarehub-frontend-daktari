import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class DeleteMessageAction extends ReduxAction<AppState> {
  DeleteMessageAction({
    required this.roomID,
    required this.eventID,
    required this.senderID,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final String roomID;
  final String eventID;
  final String senderID;
  final Function(String eventID)? onSuccess;
  final Function(String errorMsg)? onError;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(deleteMessageFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(deleteMessageFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.chatState?.userProfile?.userID ?? '';

    final bool canDelete = await canDeleteMessage(
      roomID: roomID,
      userID: userID,
      senderID: senderID,
      client: client,
    );

    if (canDelete) {
      final Response response = await ChatAPI.deleteMessage(
        client: client,
        roomID: roomID,
        senderID: senderID,
        eventID: eventID,
        userID: userID,
      );

      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 403) {
        onError?.call(
          permissionErrorMessageText,
        );
      }

      if (body.containsKey('event_id')) {
        // Remove the event from state
        final Map<String, Room>? joinedRooms =
            state.chatState?.syncResponse?.rooms?.joinedRooms;
        final List<Message?>? events = joinedRooms![roomID]?.timeline?.events;

        events?.removeWhere((Message? m) => m?.eventID == eventID);

        final Room? newRoom =
            joinedRooms[roomID]?.copyWith.timeline?.call(events: events);

        if (newRoom != null) {
          joinedRooms.addAll(<String, Room>{roomID: newRoom});

          final AppState? newState = state
              .copyWith.chatState?.syncResponse?.rooms
              ?.call(joinedRooms: joinedRooms);

          onSuccess?.call(body['event_id']?.toString() ?? '');

          return newState;
        }

        return null;
      }

      return null;
    }

    return null;
  }
}
