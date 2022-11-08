import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/permission_item_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Permission Item Widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const PermissionItemWidget(
          index: 0,
          question: 'testQuestion',
          description: 'testDescription',
          isAssigned: false,
        ),
      );

      final Finder permissionSwitch = find.byKey(permissionSwitchKey);

      await tester.tap(permissionSwitch);
      await tester.pumpAndSettle();

      expect(permissionSwitch, findsOneWidget);
    });
  });
}
