import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility_identifier.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';

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
      expect(find.byType(ListCardWithCancelButton), findsNWidgets(2));
    });
  });
}
