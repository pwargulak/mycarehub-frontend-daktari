import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/invited_groups_page.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/user_list_item_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Invited groups Page', () {
    late Store<AppState> store;
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <dynamic>[
              <String, dynamic>{
                'id': '12345',
                'name': 'Test',
                'memberCount': 3,
                'gender': <dynamic>[],
                'description': '',
                'createdBy': null
              }
            ]
          }
        }),
        201,
      ),
    );

    setUpAll(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const InvitedGroupsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(UserListItem), findsNothing);
    });
  });
}
