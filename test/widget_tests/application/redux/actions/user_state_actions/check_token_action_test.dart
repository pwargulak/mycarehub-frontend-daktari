import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/application/redux/actions/user_state_actions/check_token_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('CheckTokenAction', () {
    testWidgets('should set initial route to home if token has not expired',
        (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 15)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, AppRoutes.homePage);
    });

    testWidgets(
        'if token has expired should attempt to refresh token and set inital '
        'to home page', (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 2)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, AppRoutes.homePage);
    });

    testWidgets(
        'if token has expired and refresh token fails, should set inital route '
        'to login page', (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 2)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
                authCredentials: <String, dynamic>{},
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, AppRoutes.loginPage);
    });
  });
}

class MockCustomClient extends CustomClient {
  MockCustomClient(
    super.idToken,
    super.endpoint, {
    required super.context,
    required super.refreshTokenEndpoint,
    required super.userID,
    this.authCredentials,
  });

  final Map<String, dynamic>? authCredentials;

  @override
  Future<AuthCredentials> refreshToken() async {
    return AuthCredentials.fromJson(authCredentials ?? mockAuthCredentials);
  }
}
