import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/screening_tool_respondent_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ScreeningToolsListPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const ScreeningToolsListPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();
      final Finder violenceOption = find.text('Violence Assessment');
      final Finder contraceptiveOption = find.text('Contraceptive Assessment');
      final Finder tbOption = find.text('TB Assessment');
      final Finder alcoholOption =
          find.text('Alcohol and substance Assessment');

      expect(violenceOption, findsOneWidget);
      expect(contraceptiveOption, findsOneWidget);
      expect(tbOption, findsOneWidget);
      expect(alcoholOption, findsOneWidget);

      await tester.tap(violenceOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.VIOLENCE_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(contraceptiveOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(tbOption);
      await tester.pumpAndSettle();
      expect(
        find.text(
          getAssessmentScorePageTitle(
            screeningToolsType: ScreeningToolsType.TB_ASSESSMENT,
          ),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      await tester.ensureVisible(alcoholOption);
      await tester.pumpAndSettle();

      await tester.tap(alcoholOption);
      await tester.pumpAndSettle();

      await tester.tap(
        find.byType(ScreeningToolRespondentWidget).first,
      );
      await tester.pumpAndSettle();
      expect(find.byType(ScreeningToolAnswersPage), findsOneWidget);
    });

    testWidgets('should show a loading indicator when fetching screening tools',
        (WidgetTester tester) async {
      store
          .dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const ScreeningToolsListPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets(
      'Handles no data',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'data': null}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const ScreeningToolsListPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byType(GenericErrorWidget);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should show an error widget when fetching screening tools',
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
          widget: const ScreeningToolsListPage(),
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
      'should show zero state for empty responses',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'getFacilityRespondedScreeningTools': <String, dynamic>{
                    'screeningTools': <dynamic>[]
                  }
                }
              },
            ),
            200,
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return MaterialButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.screeningToolsListPage,
                ),
              );
            },
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(MaterialButton));
        await tester.pumpAndSettle();

        final Finder helpNoDataWidget = find.byType(MyAfyaHubPrimaryButton);

        expect(helpNoDataWidget, findsOneWidget);
        await tester.tap(helpNoDataWidget);
        await tester.pumpAndSettle();
        expect(helpNoDataWidget, findsNothing);
      },
    );
  });
}
