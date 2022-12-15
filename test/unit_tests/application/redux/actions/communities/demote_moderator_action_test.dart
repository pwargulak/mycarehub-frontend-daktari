import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/demote_moderator_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks/mocks.dart';
import 'demote_moderator_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('DemoteModeratorAction', () {
    late IGraphQlClient client;
    late StoreTester<AppState> storeTester;

    setUp(() {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, bool>{'demoteModerators': true}
          }),
          200,
        ),
      );

      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('runs successfully if API call is successful', () async {
      int successCounter = 0;

      storeTester.dispatch(
        DemoteModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      await storeTester.waitUntil(DemoteModeratorAction);

      expect(successCounter, 1);
    });

    test('throws error if API call returns error', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{}),
          400,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        DemoteModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DemoteModeratorAction);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(somethingWentWrongText),
      );
    });

    test('should throw user exception if response is false', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, bool>{'demoteModerators': false}
          }),
          200,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        DemoteModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(errorPromotingAdminText),
      );
    });

    test('should throw user exception if response contains error', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some-error'}),
          200,
        ),
      );

      int successCounter = 0;

      storeTester.dispatch(
        DemoteModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntilErrorGetLast(error: UserException);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(errorDemotingAdminText),
      );
    });

    test('should handle unexpected error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      int successCounter = 0;

      storeTester.dispatch(
        DemoteModeratorAction(
          client: client,
          memberIds: <String>['memberId'],
          communityId: 'communityId',
          successCallback: () => successCounter++,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DemoteModeratorAction);

      expect(successCounter, 0);
      expect(
        info.errors.removeFirst(),
        const UserException(somethingWentWrongText),
      );
    });
  });
}
