import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/communities_logout_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/sync_response_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/review_invite_widget.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_page.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Invite review widget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets('should build correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ReviewInviteWidget(
          room: Room.fromJson(roomMock),
        ),
      );

      expect(find.text('Join Group'), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      /// Simulate a loading indicator
      store.dispatch(WaitAction<AppState>.add(joinRoomFlag));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should accept an invite and join a group',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ReviewInviteWidget(
          room: Room.fromJson(roomMock)
              .copyWith
              .call(roomID: '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org'),
        ),
      );

      expect(find.byKey(acceptInviteKey), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      await tester.tap(find.byKey(acceptInviteKey));
      await tester.pumpAndSettle();
      store.dispatch(CommunitiesLogoutAction());
      await tester.pumpAndSettle();

      expect(find.byType(RoomListPage), findsOneWidget);
    });

    testWidgets('should decline an invite', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ReviewInviteWidget(
          room: Room.fromJson(roomMock),
        ),
      );

      expect(find.byKey(acceptInviteKey), findsOneWidget);
      expect(find.byKey(declineInviteKey), findsOneWidget);

      await tester.tap(find.byKey(declineInviteKey));
      await tester.pumpAndSettle();

      /// No action is really done on the button so there is nothing to assert
    });
  });
}
