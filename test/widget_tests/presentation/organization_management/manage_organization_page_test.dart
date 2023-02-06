import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/organization_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('Manage Organization Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(createOrganizationButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(CreateOrganizationPage), findsOneWidget);
    });

    testWidgets('navigates to details page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byType(OrganizationListItem).first);
      await tester.pumpAndSettle();
      expect(find.byType(OrganizationDetailPage), findsOneWidget);
    });

    testWidgets('search organisation works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(searchOrganizationButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(2));
    });

    testWidgets('search organisation works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(searchOrganizationButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(2));
    });
  });
}
