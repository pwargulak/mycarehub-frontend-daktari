import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/create_group/create_group_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/create_group/create_group_payload.dart';
import 'package:http/http.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('CreateGroupAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should run successfully', () async {
      int called = 0;

      storeTester.dispatch(
        CreateGroupAction(
          createGroupPayload: CreateGroupPayload(
            name: UNKNOWN,
            gender: <Gender>[Gender.male],
          ),
          client: MockTestGraphQlClient(),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CreateGroupAction);

      expect(info.state, AppState.initial());
      expect(called, 1);
    });

    test('should throw error if api call is not 200', () async {
      int called = 0;

      storeTester.dispatch(
        CreateGroupAction(
          createGroupPayload: CreateGroupPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CreateGroupAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      int called = 0;

      storeTester.dispatch(
        CreateGroupAction(
          createGroupPayload: CreateGroupPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CreateGroupAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });
  });
}
