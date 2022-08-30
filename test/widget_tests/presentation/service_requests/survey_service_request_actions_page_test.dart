import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/reach_out_channel_widget.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_responses_preview_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('SurveyServiceRequestActionsPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SurveyServiceRequestActionsPage(
          surveyRespondent: SurveyRespondent(
            name: 'test',
            id: 'test',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder reachOutChannelWidget = find.byType(ReachOutChannelWidget);
      expect(reachOutChannelWidget, findsNWidgets(2));
    });
    testWidgets('navigates to SurveyResponsesPreviewPage correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: SurveyServiceRequestActionsPage(
          surveyRespondent: SurveyRespondent(
            name: 'test',
            id: 'test',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder reachOutChannelWidget = find.byType(ReachOutChannelWidget);
      expect(reachOutChannelWidget, findsNWidgets(2));

      await tester.tap(find.byKey(mentalHealthSurveyButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SurveyResponsesPreviewPage), findsOneWidget);
    });

    testWidgets('resolve button works correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateServiceRequestsStateAction(
          clientServiceRequests: <ServiceRequest>[ServiceRequest(id: UNKNOWN)],
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: SurveyServiceRequestActionsPage(
          surveyRespondent: SurveyRespondent(
            name: 'test',
            id: 'test',
          ),
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
    testWidgets(
        'shows snackbar with error message when error occurs while resolving',
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
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: SurveyServiceRequestActionsPage(
          surveyRespondent: SurveyRespondent(
            name: 'test',
            id: 'test',
          ),
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
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(somethingWentWrongText), findsOneWidget);
    });
    testWidgets('shows snackbar with error message when result is not true',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'resolveServiceRequest': false}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: SurveyServiceRequestActionsPage(
          surveyRespondent: SurveyRespondent(
            name: 'test',
            id: 'test',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder resolveRequestButton = find.byKey(resolveRequestButtonKey);
      final Finder referredActionCheckBox =
          find.byKey(const Key('referred_to_community_services'));
      expect(resolveRequestButton, findsOneWidget);
      expect(referredActionCheckBox, findsOneWidget);

      await tester.ensureVisible(referredActionCheckBox);
      await tester.tap(referredActionCheckBox);
      await tester.pumpAndSettle();
      await tester.ensureVisible(resolveRequestButton);
      await tester.tap(resolveRequestButton);
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(somethingWentWrongText), findsOneWidget);
    });
  });
}
