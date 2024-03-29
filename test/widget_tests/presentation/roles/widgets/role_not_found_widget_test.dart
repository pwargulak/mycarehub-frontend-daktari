import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/role_not_found_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Search Roles Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const Scaffold(
          body: RoleNotFoundWidget(),
        ),
      );

      await tester.pumpAndSettle();

      final Finder createRoleBtnFinder = find.byKey(createRoleButtonKey);

      expect(createRoleBtnFinder, findsOneWidget);

      await tester.tap(createRoleBtnFinder);
      await tester.pumpAndSettle();
      // TODO(Byron): Add more expectation when logic is added here
    });
  });
}
