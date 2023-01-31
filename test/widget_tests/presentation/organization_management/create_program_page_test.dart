import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Create Program Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(3));
    });

    testWidgets('Cancel button works correctly correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(3));
      await tester.ensureVisible(find.byKey(cancelButtonKey).first);

      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(cancelButtonKey).at(1));
      await tester.tap(find.byKey(cancelButtonKey).at(1));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(cancelButtonKey).last);
      await tester.tap(find.byKey(cancelButtonKey).last);
      await tester.pumpAndSettle();
    });

    testWidgets('Add Facility works correctly correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(3));

      await tester.ensureVisible(find.byKey(addFacilityButtonKey));
      await tester.tap(find.byKey(addFacilityButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SearchFacilitiesPage), findsOneWidget);
    });
  });
}
