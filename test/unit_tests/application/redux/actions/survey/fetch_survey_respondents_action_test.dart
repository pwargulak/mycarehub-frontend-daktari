import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/fetch_survey_respondents_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchSurveyRespondentsAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should complete normally', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': surveyRespondentsMock}),
          200,
        ),
      );

      storeTester.dispatch(
        FetchSurveyRespondentsAction(
          client: client,
          projectID: 1,
          formID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchSurveyRespondentsAction);

      expect(
        info.state.surveyState?.surveyRespondentsState?.surveyRespondents
            ?.length,
        2,
      );
    });

    test('should handle exception', () async {
      storeTester.dispatch(
        FetchSurveyRespondentsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'wrong error': 'error occurred'}),
              400,
            ),
          ),
          projectID: 1,
          formID: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchSurveyRespondentsAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
