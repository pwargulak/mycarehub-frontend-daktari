import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/admin/admin_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Admin Page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AdminPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ActionCard), findsNWidgets(2));
    });

    testWidgets('organizations card navigates to organizations page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AdminPage(),
      );
      final Finder organizationsPageFinder =
          find.byType(ManageOrganizationPage);

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(organizationsCardKey));
      await tester.pumpAndSettle();

      expect(organizationsPageFinder, findsOneWidget);
    });

    testWidgets('programs card navigates to programs page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AdminPage(),
      );
      final Finder organizationsPageFinder = find.byType(ManageProgramsPage);

      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(programsCardKey));
      await tester.tap(find.byKey(programsCardKey));
      await tester.pumpAndSettle();

      expect(organizationsPageFinder, findsOneWidget);
    });
  });
}
