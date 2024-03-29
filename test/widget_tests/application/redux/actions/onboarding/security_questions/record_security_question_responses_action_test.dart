// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/security_questions/record_security_question_responses_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('RecordSecurityQuestionResponsesAction', () {
    late Store<AppState> store;

    setUpAll(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
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
              onPressed: () async {
                try {
                  store.dispatch(
                    UpdateOnboardingStateAction(
                      securityQuestionsResponses: <SecurityQuestionResponse>[],
                    ),
                  );
                  await store.dispatch(
                    RecordSecurityQuestionResponsesAction(
                      context: context,
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

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
