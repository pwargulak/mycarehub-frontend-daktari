// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_respondents_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/surveys_card.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Surveys Page', () {
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
              child: const SurveysPage(),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(surveysInvitedToString), findsOneWidget);
      expect(find.byType(SurveysCard), findsNWidgets(2));
    });

    testWidgets(
        'Survey Card button pressed navigates Surveys Sender List Page ',
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
      await tester.pumpAndSettle();

      final Finder mentalHealthSurveyFinder =
          find.byType(MyAfyaHubPrimaryButton).first;

      await tester.ensureVisible(mentalHealthSurveyFinder);
      await tester.pumpAndSettle();
      await tester.tap(mentalHealthSurveyFinder);
    });
    testWidgets('Survey Card button pressed navigates to responses page',
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
      await tester.pumpAndSettle();

      final Finder viewResponsesFinder =
          find.byKey(viewResponsesButtonKey).first;

      await tester.ensureVisible(viewResponsesFinder);
      await tester.pumpAndSettle();
      await tester.tap(viewResponsesFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SurveyRespondentsPage), findsOneWidget);
    });
    testWidgets(
        'should display zero state widget that navigates to Home when tapped',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store = Store<AppState>(initialState: AppState.initial());
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listSurveys': <dynamic>[],
            },
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const SurveysPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
      await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets(
        'should display zero state widget that pops the page when tapped',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store = Store<AppState>(initialState: AppState.initial());
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listSurveys': <dynamic>[],
            },
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
            return MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.surveysPage),
            );
          },
        ),
      );
      final Finder helpNoDataWidget = find.byKey(helpNoDataWidgetKey);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(helpNoDataWidget, findsOneWidget);
      await tester.ensureVisible(helpNoDataWidget);
      await tester.tap(helpNoDataWidget);
      await tester.pumpAndSettle();

      expect(helpNoDataWidget, findsNothing);
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
          widget: const SurveysPage(),
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
    testWidgets('should show a loading indicator when fetching surveys',
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
      store.dispatch(WaitAction<AppState>.add(fetchSurveysFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const SurveysPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
