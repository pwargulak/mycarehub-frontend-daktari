import 'dart:convert';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_respondents_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_responses_preview_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_respondent_item_card.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SurveyRespondents Page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: SurveyRespondentsPage(selectedSurvey: Survey.initial()),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SurveyRespondentItemCard), findsNWidgets(2));
    });
    testWidgets('navigates to survey responses preview page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: SurveyRespondentsPage(selectedSurvey: Survey.initial()),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      final Finder respondentItem = find.byType(SurveyRespondentItemCard);

      expect(respondentItem, findsNWidgets(2));

      await tester.tap(respondentItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(SurveyResponsesPreviewPage), findsOneWidget);
    });

    testWidgets(
      'should show an error widget when an error occurs',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: SurveyRespondentsPage(
            selectedSurvey: Survey.initial(),
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
        'should show a loading indicator when fetching survey respondents',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SurveyRespondentsPage(
          selectedSurvey: Survey.initial(),
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
