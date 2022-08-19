import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_responses_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() async {
    store = Store<AppState>(initialState: AppState.initial());
    setupFirebaseMessagingMocks();
    await Firebase.initializeApp();
  });
  group('Survey responses page', () {
    testWidgets(
        'Survey responses page renders correctly when there are no responses',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const SurveyResponsesPage(appBarTitle: 'PHQ survey'),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CustomAppBar), findsOneWidget);

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SurveysPage), findsOneWidget);
    });
  });
}
