import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility_identifier.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Program Detail View Page', () {
    final Facility testFacility = Facility(
      name: 'some name',
      description: 'some description',
      country: 'Kenya',
      fhirOrganisationID: 'some id',
      facilityIdentifier: FacilityIdentifier(
        id: 'some id',
        value: 'some value',
        type: 'some type',
      ),
      active: true,
      id: 'some id',
      phone: '0712345678',
    );
    store.dispatch(
      UpdateProgramsStateAction(
        selectedPrograms: <Program>[Program(
          name: 'some name',
          description: 'some description',
          facilities: <Facility>[testFacility, testFacility],
          id: 'some id',
          active: true,
        )],
      ),
    );
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ProgramDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));

      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.tap(find.byKey(cancelButtonKey).last);
      await tester.pumpAndSettle();
      //TODO(Byron) Add more expectations when backend data is available
    });

    testWidgets('add facility button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ProgramDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));

      await tester.ensureVisible(find.byKey(addFacilityButtonKey));
      await tester.tap(find.byKey(addFacilityButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SearchFacilitiesPage), findsOneWidget);
    });
  });
}
