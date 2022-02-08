import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:healthcloud/presentation/onboarding/patient/date_picker.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('AddNewPatientPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('register button calls RegisterClientAction',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewPatientPage(),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder cccFieldFinder = find.byKey(cccFieldKey);
      expect(cccFieldFinder, findsOneWidget);
      await tester.tap(cccFieldFinder);
      await tester.enterText(cccFieldFinder, '12345678');

      final Finder fNameFieldFinder = find.byKey(firstNameKey);
      expect(fNameFieldFinder, findsOneWidget);
      await tester.tap(fNameFieldFinder);
      await tester.enterText(fNameFieldFinder, 'John');

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.tap(lNameFieldFinder);
      await tester.enterText(lNameFieldFinder, 'Doe');

      final Finder genderFieldFinder = find.byKey(genderOptionFieldKey);
      expect(genderFieldFinder, findsOneWidget);
      await tester.tap(genderFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      final Finder facilityFieldFinder =
          find.byKey(facilitySelectOptionFieldKey);
      expect(facilityFieldFinder, findsOneWidget);
      await tester.tap(facilityFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Kanairo').last);
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(phoneNumberFieldKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      // Dob field
      await tester.tap(find.byKey(dobKey));
      await tester.pumpAndSettle();
      expect(find.text(eligibleYear.year.toString()), findsOneWidget);
      await tester.tap(find.text(eligibleYear.year.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Enrollment field
      final Finder enrollmentField = find.byKey(enrollmentFieldKey);
      await tester.ensureVisible(enrollmentField);
      await tester.tap(enrollmentField);
      await tester.pumpAndSettle();
      expect(find.text(eligibleYear.year.toString()), findsOneWidget);
      await tester.tap(find.text(eligibleYear.year.toString()));
      await tester.pumpAndSettle();
      expect(find.text(currentDay.toString()), findsOneWidget);
      await tester.tap(find.text(currentDay.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      final Finder clientTypeFinder = find.byKey(clientTypeField);
      expect(clientTypeFinder, findsOneWidget);
      await tester.tap(clientTypeFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('PMTCT').last);
      await tester.pumpAndSettle();

      final Finder registerBtnFinder = find.byKey(patientRegisterBtnKey);
      await tester.ensureVisible(registerBtnFinder);
      await tester.tap(registerBtnFinder);
      await tester.pumpAndSettle();

      // TODO: change once action is implemented
      expect(store.state, AppState.initial());
    });

    testWidgets('ccc number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewPatientPage(),
      );
      await tester.pumpAndSettle();

      final Finder cccFieldFinder = find.byKey(cccFieldKey);
      expect(cccFieldFinder, findsOneWidget);
      await tester.enterText(cccFieldFinder, 'test');
      expect(find.text('test'), findsOneWidget);

      await tester.enterText(cccFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('first name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewPatientPage(),
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
        widget: const AddNewPatientPage(),
      );
      await tester.pumpAndSettle();

      final Finder lNameFieldFinder = find.byKey(lastNameKey);
      expect(lNameFieldFinder, findsOneWidget);
      await tester.enterText(lNameFieldFinder, 'Doe');

      await tester.enterText(lNameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('phonenumber field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const AddNewPatientPage(),
      );
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(phoneNumberFieldKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      await tester.enterText(phoneNumberFieldFinder, '');
      await tester.pump();

      expect(find.text('Invalid phone number'), findsOneWidget);
    });
  });
}
