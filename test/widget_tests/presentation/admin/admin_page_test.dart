import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/admin/admin_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';

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
        widget: AdminPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('adminSvgPath')), findsOneWidget);
      expect(find.byType(ActionCard), findsNWidgets(3));
    });

    testWidgets('roles card navigates to roles page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: AdminPage(),
      );
      final Finder roleCardFinder = find.byKey(rolesCardKey);
      await tester.pumpAndSettle();
      expect(roleCardFinder, findsOneWidget);

      await tester.tap(roleCardFinder);
    });
  });
}
