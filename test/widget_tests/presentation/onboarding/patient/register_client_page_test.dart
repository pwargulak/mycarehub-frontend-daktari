import 'dart:convert';

import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AddNewPatientPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store.dispatch(
        UpdateProgramsStateAction(
          selectedUserProgram: Program(
            name: 'testName',
            id: 'testId',
            organisation: Organisation(
              name: 'testName',
              description: 'testDesc',
            ),
          ),
        ),
      );
    });

    testWidgets('register button calls RegisterClientAction',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterClientPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder cccFieldFinder = find.byKey(cccFieldKey);
      expect(cccFieldFinder, findsOneWidget);
      await tester.tap(cccFieldFinder);
      await tester.enterText(cccFieldFinder, '12345678');

      final Finder usernameFieldFinder = find.byKey(usernameFieldKey);
      expect(usernameFieldFinder, findsOneWidget);
      await tester.ensureVisible(usernameFieldFinder);
      await tester.tap(usernameFieldFinder);
      await tester.enterText(usernameFieldFinder, 'testUsername');

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      final Finder saveFacilityBtnFinder = find.byKey(saveFacilityBtnKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.ensureVisible(facilityFieldFinder);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();
      await tester.tap(saveFacilityBtnFinder);
      await tester.pumpAndSettle();

      final Finder searchFacilityIconBtnFinder =
          find.byKey(searchFacilityIconBtnKey);
      await tester.tap(searchFacilityIconBtnFinder);
      await tester.pumpAndSettle();

      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();
      await tester.tap(saveFacilityBtnFinder);
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');

      // Dob field
      final Finder dobField = find.byKey(dobKey);
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      final Finder continueButtonFinder = find.byKey(continueKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      // Enrollment field
      final Finder enrollmentField = find.byKey(enrollmentFieldKey);
      await tester.ensureVisible(enrollmentField);
      await tester.tap(enrollmentField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(continueButtonFinder, findsOneWidget);
      await tester.ensureVisible(continueButtonFinder);
      await tester.tap(continueButtonFinder);
      await tester.pumpAndSettle();
      expect(continueButtonFinder, findsNothing);

      final Finder clientTypeFinder =
          find.byKey(ValueKey<String>(ClientType.PMTCT.name));
      expect(clientTypeFinder, findsOneWidget);
      await tester.ensureVisible(clientTypeFinder);
      await tester.tap(clientTypeFinder);
      await tester.pumpAndSettle();

      final Finder appInviteCheckBox = find.byKey(myAfyaHubInviteKey);
      expect(appInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(appInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(appInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(appInviteCheckBox);
      await tester.pumpAndSettle();

      final Finder registerBtnFinder = find.byKey(patientRegisterBtnKey);
      await tester.ensureVisible(registerBtnFinder);
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(registerClientSuccess), findsOneWidget);
    });

    testWidgets('register button should show error if no connection',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterClientPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder cccFieldFinder = find.byKey(cccFieldKey);
      expect(cccFieldFinder, findsOneWidget);
      await tester.tap(cccFieldFinder);
      await tester.enterText(cccFieldFinder, '12345678');

      final Finder usernameFieldFinder = find.byKey(usernameFieldKey);
      expect(usernameFieldFinder, findsOneWidget);
      await tester.ensureVisible(usernameFieldFinder);
      await tester.tap(usernameFieldFinder);
      await tester.enterText(usernameFieldFinder, 'testUsername');

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      final Finder saveFacilityBtnFinder = find.byKey(saveFacilityBtnKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.ensureVisible(facilityFieldFinder);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();
      await tester.tap(saveFacilityBtnFinder);
      await tester.pumpAndSettle();

      final Finder searchFacilityIconBtnFinder =
          find.byKey(searchFacilityIconBtnKey);
      await tester.tap(searchFacilityIconBtnFinder);
      await tester.pumpAndSettle();

      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();
      await tester.tap(saveFacilityBtnFinder);
      await tester.pumpAndSettle();

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');

      // Dob field
      final Finder dobField = find.byKey(dobKey);
      await tester.ensureVisible(dobField);
      await tester.tap(dobField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      final Finder continueButtonFinder = find.byKey(continueKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      // Enrollment field
      final Finder enrollmentField = find.byKey(enrollmentFieldKey);
      await tester.ensureVisible(enrollmentField);
      await tester.tap(enrollmentField);
      await tester.pumpAndSettle();
      expect(find.text(currentYear.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(continueButtonFinder, findsOneWidget);
      await tester.ensureVisible(continueButtonFinder);
      await tester.tap(continueButtonFinder);
      await tester.pumpAndSettle();
      expect(continueButtonFinder, findsNothing);

      final Finder clientTypeFinder =
          find.byKey(ValueKey<String>(ClientType.PMTCT.name));
      expect(clientTypeFinder, findsOneWidget);
      await tester.ensureVisible(clientTypeFinder);
      await tester.tap(clientTypeFinder);
      await tester.pumpAndSettle();

      final Finder appInviteCheckBox = find.byKey(myAfyaHubInviteKey);
      expect(appInviteCheckBox, findsOneWidget);
      await tester.ensureVisible(appInviteCheckBox);

      final Checkbox checkBox =
          tester.firstWidget(appInviteCheckBox) as Checkbox;

      expect(checkBox.value, false);

      await tester.tap(appInviteCheckBox);
      await tester.pumpAndSettle();

      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await tester.pumpAndSettle();

      final Finder registerBtnFinder = find.byKey(patientRegisterBtnKey);
      await tester.ensureVisible(registerBtnFinder);
      await tester.tap(registerBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('ccc number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterClientPage(),
      );
      await tester.pumpAndSettle();

      final Finder cccFieldFinder = find.byKey(cccFieldKey);
      await tester.enterText(cccFieldFinder, '1234567890');
      expect(find.text('1234567890'), findsOneWidget);

      await tester.enterText(cccFieldFinder, '');
      await tester.pump();

      expect(find.text(enterAValidCCCNumberText), findsOneWidget);
    });

    testWidgets('first name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterClientPage(),
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
        widget: const RegisterClientPage(),
      );
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.enterText(lNameFieldFinder, 'Doe');

      await tester.enterText(lNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('phone number field should show error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'errors': 'some error occurred'}),
          201,
        ),
      );
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const RegisterClientPage(),
        graphQlClient: mockShortGraphQlClient,
      );
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(patientNumberField);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      final Finder usernameFieldFinder = find.byKey(usernameFieldKey);
      expect(usernameFieldFinder, findsOneWidget);
      await tester.ensureVisible(usernameFieldFinder);
      await tester.tap(usernameFieldFinder);
      await tester.enterText(usernameFieldFinder, 'testUsername');

      await tester.enterText(phoneNumberFieldFinder, '');
      await tester.pump();

      expect(find.text('Phone number is required'), findsOneWidget);
    });
  });
}
