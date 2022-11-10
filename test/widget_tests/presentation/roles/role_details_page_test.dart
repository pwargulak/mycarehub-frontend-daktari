import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/roles/role_details_page.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/permission_item_widget.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/revoke_role_dialog.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Role Details Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const RoleDetailsPage(),
      );

      final Finder revokeRoleButton = find.byKey(revokeRoleButtonKey);
      final Finder cancelButton = find.byKey(cancelButtonKey);

      expect(revokeRoleButton, findsOneWidget);
      expect(find.byType(PermissionItemWidget), findsNWidgets(4));

      await tester.ensureVisible(revokeRoleButton);
      await tester.tap(revokeRoleButton);
      await tester.pumpAndSettle();

      expect(find.byType(RevokeRoleDialog), findsOneWidget);
      expect(cancelButton, findsOneWidget);

      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(cancelButton, findsNothing);
    });
  });
}
