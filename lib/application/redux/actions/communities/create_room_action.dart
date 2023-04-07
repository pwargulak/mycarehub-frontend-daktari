import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class CreateRoomAction extends ReduxAction<AppState> {
  CreateRoomAction({
    required this.roomName,
    required this.topic,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final String? roomName;
  final String? topic;
  final Function(String roomID)? onSuccess;
  final Function(String error)? onError;

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createRoomFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(createRoomFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await ChatAPI.createRoom(
      client: client,
      roomName: roomName ?? '',
      topic: topic ?? '',
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> decodedResponse =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;

      if (decodedResponse.containsKey('room_id')) {
        onSuccess?.call(decodedResponse['room_id']?.toString() ?? '');
        return state;
      }
    }

    return null;
  }
}
