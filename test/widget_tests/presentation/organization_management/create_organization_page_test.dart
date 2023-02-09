import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() async {
    store = Store<AppState>(
      initialState: AppState.initial()
          .copyWith(connectivityState: ConnectivityState(isConnected: true)),
    );
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
  });

  group('Create Organization Page', () {
    testWidgets('create button calls RegisterClientAction',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateOrganizationPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      await tester.ensureVisible(find.byKey(cancelButtonKey).first);
      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(cancelButtonKey).last);
      await tester.tap(find.byKey(cancelButtonKey).last);

      await tester.pumpAndSettle();

      final Finder registrationNumberField = find.byKey(registrationNumberKey);
      expect(registrationNumberField, findsOneWidget);
      await tester.ensureVisible(registrationNumberField);
      await tester.tap(registrationNumberField);
      await tester.enterText(registrationNumberField, '12345678');

      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(phoneNumberKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.ensureVisible(phoneNumberFieldFinder);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      await tester.pumpAndSettle();

      final Finder nameFieldFinder = find.byKey(nameKey);
      expect(nameFieldFinder, findsOneWidget);
      await tester.ensureVisible(nameFieldFinder);
      await tester.tap(nameFieldFinder);
      await tester.enterText(nameFieldFinder, 'Eugene');

      final Finder descriptionFieldFinder = find.byKey(descriptionKey);
      expect(descriptionFieldFinder, findsOneWidget);
      await tester.ensureVisible(descriptionFieldFinder);
      await tester.tap(descriptionFieldFinder);
      await tester.enterText(descriptionFieldFinder, 'Test description');

      final Finder countryFieldFinder = find.byKey(countryKey);
      expect(countryFieldFinder, findsOneWidget);
      await tester.ensureVisible(countryFieldFinder);
      await tester.tap(countryFieldFinder);
      await tester.enterText(countryFieldFinder, 'Kenya');

      final Finder emailFieldFinder = find.byKey(emailKey);
      expect(emailFieldFinder, findsOneWidget);
      await tester.ensureVisible(emailFieldFinder);
      await tester.tap(emailFieldFinder);
      await tester.enterText(emailFieldFinder, 'xyz@example.com');

      final Finder addressFieldFinder = find.byKey(addressKey);
      expect(addressFieldFinder, findsOneWidget);
      await tester.ensureVisible(addressFieldFinder);
      await tester.tap(addressFieldFinder);
      await tester.enterText(addressFieldFinder, 'Test address');
      await tester.pumpAndSettle();

      await tester.ensureVisible(addressFieldFinder);
      final Finder createOrganisationBtnFinder =
          find.byKey(createOrganisationBtnKey);
      await tester.ensureVisible(createOrganisationBtnFinder);
      await tester.tap(createOrganisationBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(registerOrganisationSuccess), findsOneWidget);
    });

    testWidgets('create button should show error if no connection',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateOrganizationPage(),
      );

      await tester.pumpAndSettle();

      final Finder registrationNumberField = find.byKey(registrationNumberKey);
      expect(registrationNumberField, findsOneWidget);
      await tester.ensureVisible(registrationNumberField);
      await tester.tap(registrationNumberField);
      await tester.enterText(registrationNumberField, '12345678');

      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(phoneNumberKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.ensureVisible(phoneNumberFieldFinder);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      await tester.pumpAndSettle();

      final Finder nameFieldFinder = find.byKey(nameKey);
      expect(nameFieldFinder, findsOneWidget);
      await tester.ensureVisible(nameFieldFinder);
      await tester.tap(nameFieldFinder);
      await tester.enterText(nameFieldFinder, 'Eugene');

      final Finder descriptionFieldFinder = find.byKey(descriptionKey);
      expect(descriptionFieldFinder, findsOneWidget);
      await tester.ensureVisible(descriptionFieldFinder);
      await tester.tap(descriptionFieldFinder);
      await tester.enterText(descriptionFieldFinder, 'Test description');

      final Finder countryFieldFinder = find.byKey(countryKey);
      expect(countryFieldFinder, findsOneWidget);
      await tester.ensureVisible(countryFieldFinder);
      await tester.tap(countryFieldFinder);
      await tester.enterText(countryFieldFinder, 'Kenya');

      final Finder emailFieldFinder = find.byKey(emailKey);
      expect(emailFieldFinder, findsOneWidget);
      await tester.ensureVisible(emailFieldFinder);
      await tester.tap(emailFieldFinder);
      await tester.enterText(emailFieldFinder, 'xyz@example.com');

      final Finder addressFieldFinder = find.byKey(addressKey);
      expect(addressFieldFinder, findsOneWidget);
      await tester.ensureVisible(addressFieldFinder);
      await tester.tap(addressFieldFinder);
      await tester.enterText(addressFieldFinder, 'Test address');
      await tester.pumpAndSettle();

      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await tester.pumpAndSettle();

      await tester.ensureVisible(addressFieldFinder);
      final Finder createOrganisationBtnFinder =
          find.byKey(createOrganisationBtnKey);
      await tester.ensureVisible(createOrganisationBtnFinder);
      await tester.tap(createOrganisationBtnFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(connectionLostText), findsOneWidget);
    });
    testWidgets('registration number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();
      final Finder registrationNumberField = find.byKey(registrationNumberKey);
      expect(registrationNumberField, findsOneWidget);
      await tester.ensureVisible(registrationNumberField);
      await tester.tap(registrationNumberField);
      await tester.enterText(registrationNumberField, '12345678');
      expect(find.text('12345678'), findsOneWidget);

      await tester.enterText(registrationNumberField, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
    testWidgets('name field should show error', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();
      final Finder nameFieldFinder = find.byKey(nameKey);
      expect(nameFieldFinder, findsOneWidget);
      await tester.ensureVisible(nameFieldFinder);
      await tester.tap(nameFieldFinder);
      await tester.enterText(nameFieldFinder, 'Eugene');
      expect(find.text('Eugene'), findsOneWidget);

      await tester.enterText(nameFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('phone number field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();

      final Finder phoneNumberFieldFinder = find.byKey(phoneNumberKey);
      expect(phoneNumberFieldFinder, findsOneWidget);
      await tester.ensureVisible(phoneNumberFieldFinder);
      await tester.tap(phoneNumberFieldFinder);
      await tester.enterText(phoneNumberFieldFinder, '+254798363893');

      await tester.enterText(phoneNumberFieldFinder, '');
      await tester.pump();

      expect(find.text('Phone number is required'), findsOneWidget);
    });
    testWidgets('description field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();
      final Finder descriptionFieldFinder = find.byKey(descriptionKey);
      expect(descriptionFieldFinder, findsOneWidget);
      await tester.ensureVisible(descriptionFieldFinder);
      await tester.tap(descriptionFieldFinder);
      await tester.enterText(descriptionFieldFinder, 'Test description');

      await tester.enterText(descriptionFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
    testWidgets('country field should show error', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();

      final Finder countryFieldFinder = find.byKey(countryKey);
      expect(countryFieldFinder, findsOneWidget);
      await tester.ensureVisible(countryFieldFinder);
      await tester.tap(countryFieldFinder);
      await tester.enterText(countryFieldFinder, 'Kenya');

      await tester.enterText(countryFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
    testWidgets('email field should show error', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();

      final Finder emailFieldFinder = find.byKey(emailKey);
      expect(emailFieldFinder, findsOneWidget);
      await tester.ensureVisible(emailFieldFinder);
      await tester.tap(emailFieldFinder);
      await tester.enterText(emailFieldFinder, 'xyz@example.com');
      expect(find.text('xyz@example.com'), findsOneWidget);

      await tester.enterText(emailFieldFinder, 'xyz');
      await tester.pump();

      expect(find.text(validEmailAddressText), findsOneWidget);
    });
    testWidgets('address field should show error', (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();

      final Finder addressFieldFinder = find.byKey(addressKey);
      expect(addressFieldFinder, findsOneWidget);
      await tester.ensureVisible(addressFieldFinder);
      await tester.tap(addressFieldFinder);
      await tester.enterText(addressFieldFinder, 'Test address');

      await tester.enterText(addressFieldFinder, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });
    testWidgets('add program works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateOrganizationPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      await tester.ensureVisible(find.byKey(addProgramButtonKey));
      await tester.tap(find.byKey(addProgramButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(ManageProgramsPage), findsOneWidget);
    });
  });
}
