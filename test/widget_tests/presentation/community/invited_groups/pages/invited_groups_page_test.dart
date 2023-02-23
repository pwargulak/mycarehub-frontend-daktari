import 'package:prohealth360_daktari/presentation/communities/pages/invited_groups_page.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('Invited groups Page', () {
    late Store<AppState> store;

    setUpAll(() async {
      store = Store<AppState>(
        initialState: AppState.initial(),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockGraphQlClient,
        widget: const InvitedGroupsPage(),
      );

      await tester.pump();

      expect(find.byType(CustomAppBar), findsOneWidget);
    });
  });
}
