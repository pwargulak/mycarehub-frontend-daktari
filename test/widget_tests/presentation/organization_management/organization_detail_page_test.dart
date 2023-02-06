import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  final Facility testFacility = Facility(
    id: 'some-id',
    active: true,
    description: 'some-desc',
    name: 'some-name',
    country: 'some-country',
    fhirOrganisationID: 'some-id',
    phone: '0712345678',
  );
  final Program testProgram = Program(
    id: 'some-id',
    active: true,
    description: 'some-desc',
    name: 'some-name',
    facilities: <Facility>[
      testFacility,
      testFacility,
    ],
  );
  group('Organization Detail View Page', () {
    store.dispatch(
      UpdateOrganisationsStateAction(
        selectedOrganisation: Organisation(
          description: 'some desc',
          id: 'some-id',
          name: 'name',
          programs: <Program>[testProgram, testProgram],
        ),
      ),
    );
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));

      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.tap(find.byKey(cancelButtonKey).last);

      await tester.tap(find.byType(ProgramListItem).first);
      await tester.pumpAndSettle();

      expect(find.byType(ProgramDetailPage), findsOneWidget);
    });

    testWidgets('navigates to details page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));

      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.tap(find.byKey(cancelButtonKey).last);

      await tester.tap(find.byType(ProgramListItem).last);
      await tester.pumpAndSettle();

      expect(find.byType(ProgramDetailPage), findsOneWidget);
    });

    testWidgets('add program button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailPage(),
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
