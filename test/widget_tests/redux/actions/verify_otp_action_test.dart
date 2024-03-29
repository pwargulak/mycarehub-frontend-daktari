// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/verify_otp_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('VerifyOTPAction', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .userProfileState!
            .userProfile
            !.user!
            .call(
              primaryContact: Contact(value: '+254717356476'),
              userId: 'user-id',
            )
            .copyWith
            .onboardingState!
            .call(
              otp: '123456',
              invalidOTP: false,
              phoneNumber: '+254717356476',
            ),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should fail to verify an OTP if there is an API error',
        (WidgetTester tester) async {
      expect(
        store.state.onboardingState!.failedToSendOTP,
        false,
      );

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          403,
        ),
      );

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('verify_otp'),
              onPressed: () async {
                try {
                  await store.dispatch(
                    VerifyOTPAction(
                      context: context,
                      otp: '123456',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('verify_otp')));
      await tester.pumpAndSettle();

      expect(find.text(getErrorMessage()), findsOneWidget);

      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should be invalid if otp is wrong',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyOTP': false,
            }
          }),
          201,
        ),
      );
      late dynamic err;

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('verify_otp'),
              onPressed: () async {
                try {
                  await store.dispatch(
                    VerifyOTPAction(
                      context: context,
                      otp: '123456',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('verify_otp')));
      await tester.pumpAndSettle();

      expect(err, isA<Future<dynamic>>());
      expect(find.text(invalidCode), findsWidgets);
    });
  });
}
