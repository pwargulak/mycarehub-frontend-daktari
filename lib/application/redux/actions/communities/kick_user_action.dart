import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/fetch_room_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class KickUserAction extends ReduxAction<AppState> {
  KickUserAction({
    required this.roomID,
    required this.userID,
    required this.client,
    this.reason = 'Unknown reason',
    this.onSuccess,
  });

  // The room to ban the user from
  final String roomID;

  // The user to kick
  final String userID;

  // Reason for kicking the user
  final String? reason;
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
    final Response response =
        await ChatAPI.kickUser(client: client, roomID: roomID, userID: userID);

    if (response.statusCode == 408) {
      /// handle errors here

    }

    final Map<String, dynamic> decodedResponse =
        json.decode(response.body) as Map<String, dynamic>;

    if (decodedResponse['errcode'] != null) {
      // Handle errors here
      return null;
    }

    /// Process
    if (onSuccess != null) onSuccess?.call();
    store.dispatch(FetchRoomMembersAction(roomID: roomID, client: client));

    return state;
  }
}
