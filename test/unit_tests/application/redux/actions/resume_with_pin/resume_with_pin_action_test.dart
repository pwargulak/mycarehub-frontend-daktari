import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/resume_with_pin_action/resume_with_pin_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/infrastructure/endpoints.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import '../../../../../mocks/mocks.dart';

void main() {
  group('ResumeWithPinAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() async {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    test('should handle wrong pin', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 8, 'error': '8: wrong PIN'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, wrongPINText);
    });

    test('should handle expired pin', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 48, 'error': '48: pin expired'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      expect(info.errors, isEmpty);
    });

    test('should handle unexpected error', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'error'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });

    test('should handle correct pin', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': true}
                },
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushReplacementNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushReplacementNamed?;

      expect(navDetails?.routeName, AppRoutes.loginPage);
    });

    test('should handle other error response', () async {
      storeTester.dispatch(
        ResumeWithPinAction(
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'error'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
          pin: '0000',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ResumeWithPinAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
