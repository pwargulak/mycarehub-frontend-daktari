import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/fetch_notifications_filters_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('FetchNotificationFiltersAction', () {
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
        FetchNotificationFiltersAction(
          client: MockTestGraphQlClient(),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNotificationFiltersAction);

      expect(info.state.wait!.isWaitingFor(fetchNotificationsFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        FetchNotificationFiltersAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNotificationFiltersAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        FetchNotificationFiltersAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchNotificationFiltersAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching notification filters'),
      );
    });
  });
}
