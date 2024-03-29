import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_staff/register_staff_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_staff/register_staff_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterStaffAction', () {
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
        RegisterStaffAction(
          registerStaffPayload:
              RegisterStaffPayload(staffName: 'test', staffNumber: 'test'),
          client: MockTestGraphQlClient(),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterStaffAction);

      expect(info.state, AppState.initial());
      expect(called, 1);
    });

    test('should throw error if api call is not 200', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterStaffAction(
          registerStaffPayload: RegisterStaffPayload(),
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
          await storeTester.waitUntil(RegisterStaffAction);

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
        RegisterStaffAction(
          registerStaffPayload: RegisterStaffPayload(),
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
          await storeTester.waitUntil(RegisterStaffAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if staff number exists', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterStaffAction(
          registerStaffPayload: RegisterStaffPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(
                <String, String>{'error': 'identifier already exists'},
              ),
              200,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterStaffAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        staffCccExists,
      );
    });
    test('should throw error if username exists', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterStaffAction(
          registerStaffPayload: RegisterStaffPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'username already exists'}),
              200,
            ),
          ),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterStaffAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        userWithUserNameExists,
      );
    });
  });
}
