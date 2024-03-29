import 'dart:convert';

import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_respondents_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/screening_tool_respondent_widget.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ScreeningToolRespondentsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ScreeningToolRespondentsPage(
          screeningTool: ScreeningTool.initial(),
        ),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();
      final Finder responseItem = find.byType(ScreeningToolRespondentWidget);

      expect(responseItem, findsNWidgets(2));

      await tester.tap(responseItem.first);
      await tester.pumpAndSettle();
      expect(find.byType(ScreeningToolAnswersPage), findsOneWidget);
    });

    testWidgets('should show a loading indicator when fetching screening tools',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<AppState>.add(fetchAssessmentResponsesByToolFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: ScreeningToolRespondentsPage(
          screeningTool: ScreeningTool.initial(),
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
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
          widget: ScreeningToolRespondentsPage(
            screeningTool: ScreeningTool.initial(),
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
      'should show an error correctly when fetching screening tools',
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
          widget: ScreeningToolRespondentsPage(
            screeningTool: ScreeningTool.initial(),
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
      'should show zero state for empty responses',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getFacilityRespondedScreeningTools': <String, dynamic>{
                  'screeningTools': <dynamic>[
                    <String, dynamic>{
                      'id': 'some-id',
                      'active': true,
                      'questionnaireID': 'q-id',
                      'questionnaire': <String, dynamic>{
                        'id': 'some-id',
                        'active': true,
                        'name': 'TB Assessment',
                        'description': 'TB Description'
                      }
                    },
                  ],
                  'pagination': <String, dynamic>{
                    'currentPage': 1,
                    'limit': 10,
                    'count': 1,
                    'totalPages': 1,
                    'nextPage': null,
                    'previousPage': null
                  }
                },
                'getScreeningToolRespondents': <String, dynamic>{
                  'screeningToolRespondents': <dynamic>[]
                }
              }
            }),
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
                  AppRoutes.assessmentToolResponsesPage,
                  arguments: ScreeningTool.initial(),
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
