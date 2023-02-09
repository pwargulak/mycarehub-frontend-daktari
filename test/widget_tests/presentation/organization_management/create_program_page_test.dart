import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Create Program Page', () {
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
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();

      final Finder programNameField = find.byKey(programNameFieldKey);
      expect(programNameField, findsOneWidget);

      // program description
      final Finder programDescriptionField =
          find.byKey(programDescriptionFieldKey);
      expect(programDescriptionField, findsOneWidget);

      //organisation field
      final Finder organizationSearchField =
          find.byKey(organisationSelectOptionFieldKey);
      expect(organizationSearchField, findsOneWidget);

      final Finder createProgramButton = find.byKey(addNewProgramButtonKey);
      expect(createProgramButton, findsOneWidget);
    });

    testWidgets('button create program correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();

      final Finder programNameField = find.byKey(programNameFieldKey);
      expect(programNameField, findsOneWidget);
      await tester.ensureVisible(programNameField);
      await tester.tap(programNameField);
      await tester.enterText(programNameField, 'mycarehub');
      await tester.pumpAndSettle();

      // program description
      final Finder programDescriptionField =
          find.byKey(programDescriptionFieldKey);
      expect(programDescriptionField, findsOneWidget);
      await tester.ensureVisible(programDescriptionField);
      await tester.tap(programDescriptionField);
      await tester.enterText(programDescriptionField, 'mycarehub description');
      await tester.pumpAndSettle();

      //organisation field
      final Finder organizationSearchField =
          find.byKey(organisationSelectOptionFieldKey);
      expect(organizationSearchField, findsOneWidget);
      await tester.ensureVisible(organizationSearchField);
      await tester.tap(organizationSearchField);
      await tester.pumpAndSettle();
      final Finder saveOrganisationBtnFinder =
          find.byKey(saveOrganisationBtnKey);
      expect(saveOrganisationBtnFinder, findsOneWidget);
      await tester.tap(find.text('Organisation SI THREE').last);
      await tester.pumpAndSettle();
      await tester.tap(saveOrganisationBtnFinder);
      await tester.pumpAndSettle();

      final Finder createProgramButton = find.byKey(addNewProgramButtonKey);
      await tester.ensureVisible(createProgramButton);
      await tester.tap(createProgramButton);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(createProgramSuccess), findsOneWidget);
    });

    testWidgets('create program button should show error if no connection',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      // program name
      final Finder programNameField = find.byKey(programNameFieldKey);
      expect(programNameField, findsOneWidget);
      await tester.ensureVisible(programNameField);
      await tester.tap(programNameField);
      await tester.enterText(programNameField, 'mycarehub');
      await tester.pumpAndSettle();

      // program description
      final Finder programDescriptionField =
          find.byKey(programDescriptionFieldKey);
      expect(programDescriptionField, findsOneWidget);
      await tester.ensureVisible(programDescriptionField);
      await tester.tap(programDescriptionField);
      await tester.enterText(programDescriptionField, 'mycarehub description');
      await tester.pumpAndSettle();

      //organisation field
      final Finder organizationSearchField =
          find.byKey(organisationSelectOptionFieldKey);
      expect(organizationSearchField, findsOneWidget);
      await tester.ensureVisible(organizationSearchField);
      await tester.tap(organizationSearchField);
      await tester.pumpAndSettle();
      final Finder saveOrganisationBtnFinder =
          find.byKey(saveOrganisationBtnKey);
      expect(saveOrganisationBtnFinder, findsOneWidget);
      await tester.tap(find.text('Organisation SI THREE').last);
      await tester.pumpAndSettle();
      await tester.tap(saveOrganisationBtnFinder);
      await tester.pumpAndSettle();

      store.dispatch(UpdateConnectivityAction(hasConnection: false));
      await tester.pumpAndSettle();
      final Finder createOrganisationButtonFinder =
          find.byKey(addNewProgramButtonKey);
      await tester.ensureVisible(createOrganisationButtonFinder);
      await tester.tap(createOrganisationButtonFinder);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('program name field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateProgramPage(),
      );
      await tester.pumpAndSettle();

      final Finder programNameField = find.byKey(programNameFieldKey);
      expect(programNameField, findsOneWidget);
      await tester.enterText(programNameField, 'mycarehub');

      await tester.enterText(programNameField, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('program description field should show error',
        (WidgetTester tester) async {
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: const CreateProgramPage(),
      );
      await tester.pumpAndSettle();

      final Finder programDescriptionField =
          find.byKey(programDescriptionFieldKey);
      expect(programDescriptionField, findsOneWidget);
      await tester.enterText(programDescriptionField, 'mycarehub description');

      await tester.enterText(programDescriptionField, '');
      await tester.pump();

      expect(find.text(fieldCannotBeEmptyText), findsOneWidget);
    });

    testWidgets('on organisation field cleared', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      //organisation field
      final Finder organizationSearchField =
          find.byKey(organisationSelectOptionFieldKey);
      final Finder saveOrganisationBtnFinder =
          find.byKey(saveOrganisationBtnKey);

      await tester.ensureVisible(organizationSearchField);
      await tester.tap(organizationSearchField);

      await tester.pumpAndSettle();

      expect(saveOrganisationBtnFinder, findsOneWidget);
      await tester.tap(find.text('Organisation SI THREE').last);
      await tester.pumpAndSettle();
      await tester.tap(saveOrganisationBtnFinder);
      await tester.pumpAndSettle();
      expect(organizationSearchField, findsOneWidget);

      await tester.ensureVisible(organizationSearchField);
      await tester.tap(find.byKey(searchOrganisationconBtnKey));
      await tester.pumpAndSettle();

      expect(organizationSearchField, findsOneWidget);
    });
  });
}
