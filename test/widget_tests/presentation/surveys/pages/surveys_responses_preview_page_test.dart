// Flutter imports:
// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_responses_preview_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_preview_response_item.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('SurveyResponsesPreviewPage', () {
    late Store<AppState> store;

    setUp(() async {
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
              child: SurveyResponsesPreviewPage(
                survey: Survey(name: 'test'),
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(getSurveyPreviewDescriptionText(phq9String)),
        findsOneWidget,
      );
      expect(find.byType(SurveyPreviewResponseItem), findsNWidgets(4));
    });

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
      store.dispatch(WaitAction<AppState>.add(fetchSurveyResponsesFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: SurveyResponsesPreviewPage(
          survey: Survey(name: 'test'),
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
