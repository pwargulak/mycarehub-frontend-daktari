import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/chat_state.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/sync_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  test('ChatState should convert from/to json', () {
    final ChatState state = ChatState.initial();
    final Map<String, dynamic> result = state.toJson();

    expect(result, isA<Map<String, dynamic>>());
    expect(result.containsKey('userProfile'), true);
    expect(result['searchMemberResults'], <dynamic>[]);

    final ChatState result2 = ChatState.fromJson(<String, dynamic>{
      'userProfile': loginResponseMock,
      'messages': <dynamic>[messageEventMock],
      'images': <Map<String, Uint8List?>>[],
      'lastSyncTime': 'testTime',
      'syncResponse': syncResponseMock,
      'syncState': SyncState.initial().toJson(),
    });

    expect(result2.userProfile?.isSignedIn, true);
    expect(result2.images?.length, 0);
    expect(result2.lastSyncTime, 'testTime');
    expect(result2.syncResponse?.presence?.events?.length, 1);
  });
}
