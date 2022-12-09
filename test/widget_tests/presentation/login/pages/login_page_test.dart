// Package imports:
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_page.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('LoginPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
    });

    testWidgets('Sign In button works correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockGraphQlClient,
          widget: LoginPage(),
        );

        final Finder organisationSelectFieldFinder =
            find.byKey(organisationSelectOptionFieldKey);

        final Finder saveOrganisationBtnFinder =
            find.byKey(saveOrganisationBtnKey);

        final Finder phoneLoginButton = find.byKey(loginKey);

        expect(phoneLoginButton, findsOneWidget);

        await tester.ensureVisible(find.byKey(loginKey));
        await tester.tap(phoneLoginButton);
        await tester.pumpAndSettle();

        expect(find.text(chooseOrganisationPrompt), findsOneWidget);

        expect(organisationSelectFieldFinder, findsOneWidget);

        await tester.tap(organisationSelectFieldFinder);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Organization 1'));
        await tester.pumpAndSettle();
        await tester.tap(saveOrganisationBtnFinder);
        await tester.pumpAndSettle();

        final Finder searchOrganisationIconBtnFinder =
            find.byKey(searchOrganisationIconBtnKey);
        await tester.tap(searchOrganisationIconBtnFinder);
        await tester.pumpAndSettle();

        await tester.tap(organisationSelectFieldFinder);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Organization 2'));
        await tester.pumpAndSettle();
        await tester.tap(saveOrganisationBtnFinder);
        await tester.pumpAndSettle();

        final Finder usernameFieldFinder = find.byKey(usernameFieldKey);
        expect(usernameFieldFinder, findsOneWidget);
        await tester.tap(usernameFieldFinder);
        await tester.enterText(usernameFieldFinder, 'testUsername');

        final Finder phoneLoginPinInputFinder =
            find.byKey(phoneLoginPinInputKey);
        expect(phoneLoginPinInputFinder, findsOneWidget);
        await tester.tap(phoneLoginPinInputFinder);
        await tester.enterText(phoneLoginPinInputFinder, '1234');

        await tester.ensureVisible(find.byKey(loginKey));
        await tester.tap(phoneLoginButton);
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });
    });
    testWidgets('should update state if invalid credentials are entered',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: LoginPage(),
      );
      store.dispatch(
        UpdateOnboardingStateAction(
          invalidCredentials: true,
        ),
      );

      await tester.pumpAndSettle();
      // Enter username
      final Finder usernameFieldFinder = find.byKey(usernameFieldKey);
      expect(usernameFieldFinder, findsOneWidget);
      await tester.tap(usernameFieldFinder);
      await tester.enterText(usernameFieldFinder, 'testUsername');
      await tester.pumpAndSettle();
      expect(store.state.onboardingState!.invalidCredentials, false);

      store.dispatch(
        UpdateOnboardingStateAction(
          invalidCredentials: true,
        ),
      );

      // Enter user PIN
      await tester.pumpAndSettle();
      final Finder phoneLoginPinInputFinder = find.byKey(phoneLoginPinInputKey);
      expect(phoneLoginPinInputFinder, findsOneWidget);
      await tester.tap(phoneLoginPinInputFinder);
      await tester.enterText(phoneLoginPinInputFinder, '1234');
      await tester.pumpAndSettle();
      expect(store.state.onboardingState!.invalidCredentials, false);
    });
  });
}
