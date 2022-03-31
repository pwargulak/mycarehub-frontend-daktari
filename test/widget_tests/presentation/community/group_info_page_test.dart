import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/redux/actions/communities/update_group_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';
import 'package:mycarehubpro/domain/core/entities/core/user.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/community/group_info/pages/group_info_page.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/group_member_item.dart';
import 'package:mycarehubpro/presentation/community/group_info/widgets/member_list_actions_dialog.dart';
import 'package:mycarehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:mycarehubpro/presentation/flagged_messages/pages/flagged_messages_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Group info page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateUserAction(
          user: User.initial().copyWith(roles: <Role>[communityManagementRole]),
        ),
      );
    });

    testWidgets('invite members button navigates correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: GroupInfoPage(payload: groupInfoPagePayloadMock),
      );

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text('Ruaraka Group'), findsOneWidget);

      await tester.tap(find.byKey(inviteMembersButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(InviteMembersPage), findsOneWidget);
    });

    testWidgets('flagged messages button navigates correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: GroupInfoPage(payload: groupInfoPagePayloadMock),
      );

      expect(find.text(flaggedMessagesText), findsOneWidget);

      await tester.tap(find.text(flaggedMessagesText));
      await tester.pumpAndSettle();

      expect(find.byType(FlaggedMessagesPage), findsOneWidget);
    });

    testWidgets('tap function works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: GroupInfoPage(payload: groupInfoPagePayloadMock),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(inviteMembersButtonKey), findsOneWidget);
      expect(find.text('Ruaraka Group'), findsOneWidget);

      final Finder memberItemFinder = find.byKey(const ValueKey<int>(0));
      expect(memberItemFinder, findsOneWidget);

      await tester.tap(memberItemFinder);
      await tester.pumpAndSettle();

      final Finder dialogFinder =
          find.byType(MemberListActionsDialog, skipOffstage: false);

      expect(dialogFinder, findsOneWidget);
    });

    testWidgets('display nothing when the list of group members is empty',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'listCommunityMembers': <dynamic>[]}
          }),
          401,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: GroupInfoPage(payload: groupInfoPagePayloadMock),
      );
      await tester.pumpAndSettle();
      expect(find.byType(GroupMemberItem), findsNothing);
    });

    testWidgets(
        'should show a snackbar with error message in case of error while fetching members',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );
      store.dispatch(UpdateGroupStateAction());
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: GroupInfoPage(payload: groupInfoPagePayloadMock),
      );
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
