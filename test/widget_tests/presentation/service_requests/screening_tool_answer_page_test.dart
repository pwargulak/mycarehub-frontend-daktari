import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_screening_tool_service_request_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_screening_tools_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_card.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('ScreeningToolAnswersPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: ScreeningToolAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ScreeningToolRespondent.fromJson(
              mockToolAssessmentResponses,
            ),
          },
        ),
        graphQlClient: MockTestGraphQlClient(),
      );

      expect(find.byType(AssessmentCard), findsOneWidget);
    });

    testWidgets(
        'should show a loading indicator when fetching screening tool responses',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<AppState>.add(fetchScreeningToolResponsesFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: ScreeningToolAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ScreeningToolRespondent.fromJson(
              mockAssessmentResponsesByToolType,
            )
          },
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(
      'should show an error snackbar when fetching screening tool responses fails',
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
          widget: ScreeningToolAnswersPage(
            payload: <String, dynamic>{
              'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
              'assessmentResponse': ScreeningToolRespondent.fromJson(
                mockAssessmentResponsesByToolType,
              ),
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(somethingWentWrongText), findsOneWidget);
        expect(find.text(closeString), findsOneWidget);

        await tester.tap(find.text(closeString));
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsNothing);
      },
    );

    testWidgets(
      'should show an error snackbar when API response is empty',
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
          widget: ScreeningToolAnswersPage(
            payload: <String, dynamic>{
              'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
              'assessmentResponse': ScreeningToolRespondent.fromJson(
                mockAssessmentResponsesByToolType,
              ),
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(somethingWentWrongText), findsOneWidget);
        expect(find.text(closeString), findsOneWidget);

        await tester.tap(find.text(closeString));
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsNothing);
      },
    );

    testWidgets('resolve button works correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateScreeningToolsStateAction(
          screeningToolRespondents:
              ScreeningToolsState.fromJson(<String, dynamic>{
            'getAssessmentResponsesByToolType': <dynamic>[
              mockAssessmentResponsesByToolType,
              mockAssessmentResponsesByToolType
            ]
          }).screeningToolRespondents,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ScreeningToolAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ScreeningToolRespondent.fromJson(
              mockAssessmentResponsesByToolType,
            ),
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byKey(resolveRequestButtonKey);
      const Key noActionCheckBoxKey = Key('no_further_action_required');
      const Key followUpActionCheckBoxKey = Key('follow_up_visit_booked');
      final Finder noActionCheckBox = find.byKey(noActionCheckBoxKey);
      final Finder followUpActionCheckBox =
          find.byKey(followUpActionCheckBoxKey);
      expect(resolveRequestButton, findsOneWidget);
      expect(followUpActionCheckBox, findsOneWidget);
      expect(noActionCheckBox, findsOneWidget);

      await tester.ensureVisible(noActionCheckBox);
      await tester.tap(noActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester.widget<CheckboxListTile>(find.byKey(noActionCheckBoxKey)).value,
        true,
      );

      await tester.tap(noActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester.widget<CheckboxListTile>(find.byKey(noActionCheckBoxKey)).value,
        false,
      );

      await tester.ensureVisible(followUpActionCheckBox);
      await tester.tap(followUpActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<CheckboxListTile>(find.byKey(followUpActionCheckBoxKey))
            .value,
        true,
      );

      await tester.ensureVisible(resolveRequestButton);
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(requestResolvedSuccessText), findsOneWidget);
    });

    testWidgets('shows snackbar with error message when result is not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getScreeningToolResponse': <String, dynamic>{
                'getScreeningToolResponse': <String, dynamic>{
                  'id': 'some-id',
                  'screeningToolID': 'tool-id',
                  'facilityID': 'facility-id',
                  'clientID': 'client-id',
                  'questionResponses': <dynamic>[
                    <String, dynamic>{
                      'questionType': 'CLOSE_ENDED',
                      'selectMultiple': false,
                      'responseValueType': 'STRING',
                      'sequence': 1,
                      'questionText':
                          'Have you experienced a cough for any duration?',
                      'normalizedResponse': <String, dynamic>{'0': 'Yes'}
                    },
                  ]
                }
              },
              'resolveServiceRequest': false,
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: ScreeningToolAnswersPage(
          payload: <String, dynamic>{
            'toolType': ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT,
            'assessmentResponse': ScreeningToolRespondent.fromJson(
              mockAssessmentResponsesByToolType,
            ),
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byKey(resolveRequestButtonKey);
      const Key noActionCheckBoxKey = Key('no_further_action_required');
      const Key followUpActionCheckBoxKey = Key('follow_up_visit_booked');
      final Finder noActionCheckBox = find.byKey(noActionCheckBoxKey);
      final Finder followUpActionCheckBox =
          find.byKey(followUpActionCheckBoxKey);
      expect(resolveRequestButton, findsOneWidget);
      expect(followUpActionCheckBox, findsOneWidget);
      expect(noActionCheckBox, findsOneWidget);

      await tester.ensureVisible(followUpActionCheckBox);
      await tester.tap(followUpActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<CheckboxListTile>(find.byKey(followUpActionCheckBoxKey))
            .value,
        true,
      );

      await tester.ensureVisible(followUpActionCheckBox);
      await tester.tap(followUpActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<CheckboxListTile>(find.byKey(followUpActionCheckBoxKey))
            .value,
        false,
      );

      await tester.ensureVisible(noActionCheckBox);
      await tester.tap(noActionCheckBox);
      await tester.pumpAndSettle();
      expect(
        tester.widget<CheckboxListTile>(find.byKey(noActionCheckBoxKey)).value,
        true,
      );
      await tester.ensureVisible(resolveRequestButton);
      await tester.pumpAndSettle();
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(somethingWentWrongText), findsOneWidget);
    });
    testWidgets('onFailure callback is called when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'errors': 'error'}),
          201,
        ),
      );
      String? testString;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialButton(
              onPressed: () => StoreProvider.dispatch<AppState>(
                context,
                ResolveScreeningToolServiceRequestAction(
                  screeningToolId: '',
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  actionsTaken: <String>[],
                  onFailure: () => testString = 'error',
                ),
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byType(MaterialButton);
      expect(resolveRequestButton, findsOneWidget);
      await tester.tap(resolveRequestButton);
      await tester.pumpAndSettle();
      expect(testString, 'error');
    });
  });
}
