// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_responses_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/survey_service_request_item_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('SurveyServiceRequestResponsesPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveyServiceRequestResponsesPage(
          selectedSurvey: SurveyServiceRequestItem.initial(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder surveyItem = find.byType(SurveyServiceRequestItemWidget);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(surveyItem, findsNWidgets(2));
    });

    testWidgets('should refresh correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveyServiceRequestResponsesPage(
          selectedSurvey: SurveyServiceRequestItem.initial(),
        ),
      );
      await tester.pumpAndSettle();

      final Finder surveyItem = find.byType(SurveyServiceRequestItemWidget);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(surveyItem, findsNWidgets(2));

      await tester.fling(
        find.byType(SurveyServiceRequestItemWidget).first,
        const Offset(0.0, 300.0),
        1000.0,
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(surveyItem, findsNWidgets(2));
    });

    testWidgets('Routes to SurveyServiceRequestActionsPage correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveyServiceRequestResponsesPage(
          selectedSurvey: SurveyServiceRequestItem.initial(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder surveyItem = find.byType(SurveyServiceRequestItemWidget);

      await tester.tap(surveyItem.first);
      await tester.pumpAndSettle();

      expect(find.byType(SurveyServiceRequestActionsPage), findsOneWidget);
    });

    testWidgets(
      'should show an error widget when fetching survey responses',
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
          widget: SurveyServiceRequestResponsesPage(
            selectedSurvey: SurveyServiceRequestItem.initial(),
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
        'should show a loading indicator when fetching survey responses',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: SurveyServiceRequestResponsesPage(
          selectedSurvey: SurveyServiceRequestItem.initial(),
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('genericNoData widget if no data present',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getServiceRequests': <dynamic>[]}
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        store: store,
        widget: SurveyServiceRequestResponsesPage(
          selectedSurvey: SurveyServiceRequestItem.initial(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(actionTextGenericNoData), findsOneWidget);
      await tester.tap(find.text(actionTextGenericNoData));
      await tester.pumpAndSettle();
      expect(find.byType(SurveyServiceRequestResponsesPage), findsNothing);
    });
  });
}
