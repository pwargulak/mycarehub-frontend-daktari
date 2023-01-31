import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/deactivate_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Organization Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      expect(find.byType(DeactivateWidget), findsOneWidget);

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
      expect(find.byType(DeactivateWidget), findsOneWidget);

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
      expect(find.byType(DeactivateWidget), findsOneWidget);

      await tester.ensureVisible(find.byKey(addProgramButtonKey));
      await tester.tap(find.byKey(addProgramButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(ManageProgramsPage), findsOneWidget);
    });
  });
}
