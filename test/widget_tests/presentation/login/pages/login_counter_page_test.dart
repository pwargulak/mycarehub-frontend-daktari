import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/verify_security_questions_help_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  testWidgets('LoginCounterPage should be rendered properly',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      graphQlClient: MockTestGraphQlClient(),
      widget: Builder(
        builder: (BuildContext context) {
          return const Scaffold(
            body: LoginCounterPage(
              retryTime: 20,
            ),
          );
        },
      ),
    );

    await tester.pump(const Duration(seconds: 18));

    final Finder button = find.byType(MyAfyaHubPrimaryButton);

    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(VerifySecurityQuestionsHelpPage), findsOneWidget);
  });

  testWidgets(
      'LoginCounterPage should navigate to login page when time elapses',
      (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      graphQlClient: MockTestGraphQlClient(),
      widget: Builder(
        builder: (BuildContext context) {
          return const Scaffold(
            body: LoginCounterPage(
              retryTime: 10,
            ),
          );
        },
      ),
    );

    await tester.pump(const Duration(seconds: 18));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });
}
