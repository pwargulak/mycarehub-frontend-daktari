import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/send_otp_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('SendOTPAction', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith
            .userProfileState!
            .userProfile!
            .call(
              username: 'testUser',
            )
            .copyWith
            .onboardingState!
            .call(
              otp: '1234',
              invalidOTP: false,
              phoneNumber: '+254717356476',
            ),
      );

      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('works correctly', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'sendOTP': <String, dynamic>{
                'otp': '0000',
                'phoneNumber': '254712345678'
              }
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  SendOTPAction(context: context, userName: 'username'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.otp,
        '0000',
      );
    });
    testWidgets('should fail to send an otp if the username is UNKNOWN',
        (WidgetTester tester) async {
      store = Store<AppState>(initialState: AppState.initial());

      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  SendOTPAction(context: context, userName: 'username'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.failedToSendOTP,
        true,
      );
    });

    testWidgets('should fail to send an OTP if there is an API error',
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
          json.encode(<String, dynamic>{'data': 'some data'}),
          403,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(
                  SendOTPAction(context: context, userName: 'username'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.failedToSendOTP,
        true,
      );
    });
    testWidgets(
        'should fail to send an OTP if there is an error in the response',
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
          json.encode(<String, dynamic>{'error': 'some errors'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('update_contacts'),
              onPressed: () async {
                await store.dispatch(
                  SendOTPAction(context: context, userName: 'username'),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();

      expect(
        store.state.onboardingState!.failedToSendOTP,
        true,
      );
    });
  });
}
