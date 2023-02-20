import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/register_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/register_caregiver_payload.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/afya_moja_core/src/enums.dart';
import 'package:sghi_core/domain_objects/value_objects/unknown.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('RegisterCaregiverAction', () {
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
        RegisterCaregiverAction(
          registerCaregiverPayload: RegisterCaregiverPayload(
            name: UNKNOWN,
            gender: Gender.male,
            dateOfBirth: DateTime.now(),
            phoneNumber: 'test',
          ),
          client: MockTestGraphQlClient(),
          onSuccess: () => called++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterCaregiverAction);

      expect(info.state, AppState.initial());
      expect(called, 1);
    });

    test('should throw error if api call is not 200', () async {
      int called = 0;

      storeTester.dispatch(
        RegisterCaregiverAction(
          registerCaregiverPayload: RegisterCaregiverPayload(),
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
          await storeTester.waitUntil(RegisterCaregiverAction);

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
        RegisterCaregiverAction(
          registerCaregiverPayload: RegisterCaregiverPayload(),
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
          await storeTester.waitUntil(RegisterCaregiverAction);

      expect(info.state, AppState.initial());
      expect(called, 0);
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });
    test('should throw error if client exists', () async {
      storeTester.dispatch(
        RegisterCaregiverAction(
          registerCaregiverPayload: RegisterCaregiverPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{
                'error':
                    'a client with this identifier type and value already exists'
              }),
              200,
            ),
          ),
          onSuccess: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterCaregiverAction);

      expect(info.state, AppState.initial());
      expect(
        (info.error! as UserException).msg,
        'A client with that ccc number already exists',
      );
    });

    test('should throw error if username exists', () async {
      storeTester.dispatch(
        RegisterCaregiverAction(
          registerCaregiverPayload: RegisterCaregiverPayload(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{
                'error':
                    'a client with this username type and value already exists'
              }),
              200,
            ),
          ),
          onSuccess: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RegisterCaregiverAction);

      expect(info.state, AppState.initial());
      expect(
        (info.error! as UserException).msg,
        clientUsernameExists,
      );
    });
  });
}
