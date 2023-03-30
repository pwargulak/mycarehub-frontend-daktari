import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/fetch_surveys_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchSurveysAction', () {
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
          jsonEncode(<String, dynamic>{'data': surveysMock}),
          200,
        ),
      );

      storeTester.dispatch(
        FetchSurveysAction(
          client: client,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchSurveysAction);

      expect(info.state.surveyState?.surveys?.length, 2);
    });

    test('should handle exception', () async {
      storeTester.dispatch(
        FetchSurveysAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'wrong error': 'error occurred'}),
              400,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchSurveysAction);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
