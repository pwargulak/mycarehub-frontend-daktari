import 'dart:convert';
import 'package:prohealth360_daktari/application/redux/actions/programs/search_programs_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:http/http.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('SearchProgramsAction', () {
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
        SearchProgramsAction(client: MockTestGraphQlClient(), searchTerm: ''),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchProgramsAction);

      expect(
        info.state.userProfileState?.programsState?.programs?.first.name,
        'testName',
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SearchProgramsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          searchTerm: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchProgramsAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SearchProgramsAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          searchTerm: '',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SearchProgramsAction);

      expect(
        info.state,
        AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching programs'),
      );
    });
  });
}
