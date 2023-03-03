import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/sync_response_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/create_room_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_page.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('RoomListPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should show loading indicator when syncing',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
      graphQlClient: MockTestGraphQlClient(),
        widget: const RoomListPage(),
      );

      expect(find.text('Conversations'), findsOneWidget);
      expect(find.byKey(navToCreateRoomKey), findsOneWidget);

      store.dispatch(WaitAction<AppState>.add(syncingEventsFlag));
      await tester.pump();

      expect(find.text('Fetching your messages...'), findsOneWidget);
    });

    testWidgets('should load correctly and show some rooms',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
     graphQlClient: MockTestGraphQlClient(),
        widget: const RoomListPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text('Conversations'), findsOneWidget);
      expect(find.byKey(navToCreateRoomKey), findsOneWidget);

      // Navigate to create room page and back
      await tester.tap(find.byKey(navToCreateRoomKey));
      await tester.pumpAndSettle();

      expect(find.byType(CreateRoomPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(RoomListPage), findsOneWidget);
      expect(find.byType(RoomListItemWidget), findsNWidgets(2));
    });

    testWidgets('should navigate to the room details page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
       graphQlClient: MockTestGraphQlClient(),
        widget: const RoomListPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text('Conversations'), findsOneWidget);
      expect(find.byKey(navToCreateRoomKey), findsOneWidget);

      await tester.tap(find.text(noNameString).last);
      await tester.pumpAndSettle();

      expect(find.byType(RoomPage), findsOneWidget);
    });

    testWidgets('should logout', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const RoomListPage(),
      );

      expect(find.text('Conversations'), findsOneWidget);
      expect(find.byKey(navToCreateRoomKey), findsOneWidget);

      await tester.tap(find.byKey(logoutKey));
      await tester.pumpAndSettle();
    });
  });

  group('Empty RoomListPage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should show empty state when there are no rooms and navigate to '
        'create room page and back', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
       graphQlClient: MockTestGraphQlClient(),
        widget: const RoomListPage(),
      );

      expect(find.text('Conversations'), findsOneWidget);
      expect(find.byKey(navToCreateRoomKey), findsOneWidget);

      await tester.tap(find.byKey(emptyChatsNewRoomKey));
      await tester.pumpAndSettle();

      expect(find.byType(CreateRoomPage), findsOneWidget);
    });
  });
}
