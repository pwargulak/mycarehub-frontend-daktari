import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/kick_user_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('KickUserAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('runs successfully', () async {
      bool isSuccess = false;
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: storeTester.state.chatState?.userProfile
              ?.copyWith(userID: '@abiudrn:chat.savannahghi.org'),
        ),
      );
      storeTester.dispatch(
        KickUserAction(
          client: MockTestGraphQlClient(),
          onSuccess: () {
            isSuccess = true;
          },
          roomID: 'roomID',
          userID: 'userID',
        ),
      );

      await storeTester.waitUntil(KickUserAction);
      expect(isSuccess, true);
    });
  });
}
