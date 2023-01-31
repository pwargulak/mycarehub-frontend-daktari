import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Manage Program Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      expect(find.byType(ProgramListItem), findsNWidgets(2));
      await tester.tap(find.byType(ProgramListItem).first);
      await tester.tap(find.byType(ProgramListItem).last);
      await tester.pumpAndSettle();
      //TODO(Byron) Add more expectations when backend data is available
    });

    testWidgets('Create program works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );
      final Finder createProgramFinder = find.byKey(createProgramButtonKey);
      expect(find.byType(ProgramListItem), findsNWidgets(2));

      await tester.ensureVisible(createProgramFinder);
      await tester.tap(createProgramFinder);
      await tester.pumpAndSettle();

      expect(find.byType(CreateProgramPage), findsOneWidget);
    });
  });
}
