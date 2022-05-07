// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_page.dart';
import 'package:mycarehubpro/presentation/surveys/pages/surveys_sender_list_page.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/test_helpers.dart';

void main() {
  group('Surveys Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const SurveysPage(),
            );
          },
        ),
      );

      expect(find.text(surveysInvitedToString), findsOneWidget);
      expect(find.byType(SurveysCard), findsNWidgets(2));
    });

    testWidgets(
        'Mental health survey button pressed navigates Surveys Sender List Page ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const SurveysPage(),
            );
          },
        ),
      );

      final Finder mentalHealthSurveyFinder =
          find.byKey(mentalHealthSurveyButtonKey);

      await tester.ensureVisible(mentalHealthSurveyFinder);
      await tester.pumpAndSettle();
      await tester.tap(mentalHealthSurveyFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SurveysSenderListPage), findsOneWidget);
    });

    testWidgets(
        'Usability survey button pressed navigates Surveys Sender List Page ',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const SurveysPage(),
            );
          },
        ),
      );

      final Finder usabilitySurveyFinder = find.byKey(usabilitySurveyButtonKey);

      await tester.ensureVisible(usabilitySurveyFinder);
      await tester.pumpAndSettle();
      await tester.tap(usabilitySurveyFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SurveysSenderListPage), findsOneWidget);
    });
  });
}
