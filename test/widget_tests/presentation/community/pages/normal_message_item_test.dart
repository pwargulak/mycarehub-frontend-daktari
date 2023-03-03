import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/chat/sync_response_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/normal_message_item.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/normal_message_widget.dart';
import 'package:sghi_core/communities/models/message.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('NormalMessageWidget', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith.chatState!.call(
              userProfile: User.fromJson(loginResponseMock),
              syncResponse: SyncResponse.fromJson(syncResponseMock),
            ),
      );
    });

    testWidgets("should process a message and show it's contents",
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
       graphQlClient: MockTestGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          isUserSent: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(NormalMessageItem), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);
    });

    testWidgets('should open the message options dialog',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
         graphQlClient: MockTestGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          isUserSent: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(NormalMessageItem), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);

      await tester.tap(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      // TODO(abiud): Verify that this option opens up the message in a new
      // page once implemented

      await tester.longPress(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      expect(find.byKey(replyMessageKey), findsOneWidget);
      expect(find.byKey(deleteMessageKey), findsOneWidget);
    });

    testWidgets('should open the message options dialog and delete a message',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
       graphQlClient: MockTestGraphQlClient(),
        widget: NormalMessageWidget(
          message: Message.fromJson(messageEventMock),
          isUserSent: true,
          roomID: '!testRoom:chat.savannahghi.org',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(NormalMessageItem), findsOneWidget);
      expect(find.text('ala!'), findsOneWidget);

      await tester.longPress(find.byKey(messageOptionsKey));
      await tester.pumpAndSettle();

      expect(find.byKey(replyMessageKey), findsOneWidget);
      expect(find.byKey(deleteMessageKey), findsOneWidget);

      await tester.tap(find.byKey(replyMessageKey));
      await tester.pumpAndSettle();

      // TODO(abiud): Add assertions after implementation is done

      await tester.tap(find.byKey(deleteMessageKey));
      await tester.pumpAndSettle();

      // We can't assert this because it pops after completion
    });
  });
}
