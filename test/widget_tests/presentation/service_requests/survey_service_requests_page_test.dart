// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/update_survey_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_responses_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/survey_service_request_item_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('RedFlagsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SurveyServiceRequestsPage(),
      );
      await tester.pumpAndSettle();
      final Finder surveyItem = find.byType(SurveyServiceRequestItemWidget);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(surveyItem, findsNWidgets(2));
    });

    testWidgets(
      'should show an error widget when error occurs',
      (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: const SurveyServiceRequestsPage(),
        );

        await tester.pumpAndSettle();
        store.dispatch(
          UpdateSurveyStateAction(
            errorFetchingSurveys: true,
          ),
        );
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);
        await tester.pumpAndSettle();

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );

        testWidgets('Routes to SurveyServiceRequestResponsesPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SurveyServiceRequestsPage(
        ),
      );
      await tester.pumpAndSettle();
      final Finder surveyItem = find.byType(SurveyServiceRequestItemWidget);

      await tester.tap(surveyItem.first);
      await tester.pumpAndSettle();

      expect(find.byType(SurveyServiceRequestResponsesPage), findsOneWidget);
    });

    testWidgets('should show a loading indicator', (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchSurveysFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SurveyServiceRequestsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('shows genericNoData widget if no data present',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SurveyServiceRequestsPage(),
        store: store,
      );
      await tester.pumpAndSettle();
      store.dispatch(
        UpdateSurveyStateAction(
          surveys: <Survey>[],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.text(actionTextGenericNoData));
      await tester.pumpAndSettle();
      expect(find.byType(SurveyServiceRequestsPage), findsNothing);
    });
  });
}
