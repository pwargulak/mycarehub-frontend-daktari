import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/caregiver/register_caregiver_page.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Register Caregiver Page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: const RegisterCaregiverPage(),
      );

      final Finder dobField = find.byKey(dobKey);
      expect(dobField, findsOneWidget);
      expect(find.byKey(patientNumberField), findsOneWidget);
      expect(find.byKey(registerCaregiverButtonKey), findsOneWidget);
      // Dob field
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.ensureVisible(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(addClientsButtonKey));
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.ensureVisible(fNameFieldFinder);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.ensureVisible(fNameFieldFinder);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.ensureVisible(phoneNumberFieldFinder);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      //Gender field
      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();
      expect(find.text('Male'), findsWidgets);

      final Finder registerBtnFinder = find.byKey(registerCaregiverButtonKey);
      await tester.ensureVisible(registerBtnFinder);
      await tester.pumpAndSettle();
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(registerCaregiverSuccess), findsOneWidget);
    });
    testWidgets('register button should show error if no connection',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        graphQlClient: MockTestGraphQlClient(),
        widget: const RegisterCaregiverPage(),
      );

      final Finder dobField = find.byKey(dobKey);
      expect(dobField, findsOneWidget);
      expect(find.byKey(patientNumberField), findsOneWidget);
      expect(find.byKey(registerCaregiverButtonKey), findsOneWidget);
      // Dob field
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.ensureVisible(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(addClientsButtonKey));
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.ensureVisible(fNameFieldFinder);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.ensureVisible(fNameFieldFinder);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.ensureVisible(phoneNumberFieldFinder);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      //Gender field
      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();
      expect(find.text('Male'), findsWidgets);

      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await tester.pumpAndSettle();
      final Finder registerBtnFinder = find.byKey(registerCaregiverButtonKey);
      await tester.ensureVisible(registerBtnFinder);
      await tester.pumpAndSettle();
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('first name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterCaregiverPage(),
      );
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.enterText(fNameFieldFinder, 'John');

      await tester.enterText(fNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
    testWidgets('last name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterCaregiverPage(),
      );
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.enterText(lNameFieldFinder, 'Doe');

      await tester.enterText(lNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
  });
}
