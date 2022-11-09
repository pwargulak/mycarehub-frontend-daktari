import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/roles/update_role_page.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/delete_role_dialog.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/permission_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Update Role Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const UpdateRolePage(),
      );

      final Finder deleteButton = find.byKey(deleteButtonKey);
      final Finder cancelButton = find.byKey(cancelButtonKey);

      expect(deleteButton, findsOneWidget);
      expect(find.byType(PermissionItemWidget), findsNWidgets(4));

      await tester.ensureVisible(deleteButton);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      expect(find.byType(DeleteRoleDialog), findsOneWidget);
      expect(find.byKey(deleteRoleButtonKey), findsOneWidget);
      expect(cancelButton, findsOneWidget);

      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(find.byKey(deleteRoleButtonKey), findsNothing);
    });
  });
}
