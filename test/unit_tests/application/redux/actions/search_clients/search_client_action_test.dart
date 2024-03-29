import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/search_client_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('SearchClientAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        SearchClientAction(
          client: MockTestGraphQlClient(),
          searchParameter: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchClientAction);

      expect(info.state.wait!.isWaitingFor(searchClientFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SearchClientAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          searchParameter: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchClientAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SearchClientAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          searchParameter: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchClientAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching clients'),
      );
    });

    test('should handle unexpected error', () async {
      storeTester.dispatch(
        SearchClientAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'wrong': 'error occurred'}),
              400,
            ),
          ),
          searchParameter: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchClientAction);

      expect(
        info.errors.removeFirst(),
        UserException(getErrorMessage()),
      );
    });
  });
}
