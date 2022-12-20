import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/client_details/pages/search_client_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/edit_client_profile_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('EditClientProfilePage', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
    });

    testWidgets(
        'should update the user profile information and navigate to the search client page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      final Finder saveButton = find.byType(ElevatedButton);
      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);
      final Finder cccNumberInput = find.byKey(cccFieldKey);

      expect(saveButton, findsOneWidget);
      expect(phoneInput, findsOneWidget);
      expect(cccNumberInput, findsOneWidget);

      await tester.enterText(phoneInput, '0712345679');

      await tester.enterText(cccNumberInput, '123456798');

      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(SearchClientPage), findsOneWidget);
    });
    testWidgets(
        'should update the user profile information and navigate to the Search client page only when phone number is updated',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );
      final Finder saveButton = find.byType(ElevatedButton);
      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);

      expect(saveButton, findsOneWidget);
      expect(phoneInput, findsOneWidget);

      await tester.enterText(phoneInput, '0712345679');
      await tester.pumpAndSettle();
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(SearchClientPage), findsOneWidget);
    });

    testWidgets(
        'should update the user profile information and navigate to the Search client page only when CCC number is updated',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      final Finder saveButton = find.byType(ElevatedButton);
      final Finder cccNumberInput = find.byKey(cccFieldKey);

      expect(saveButton, findsOneWidget);
      expect(cccNumberInput, findsOneWidget);

      await tester.enterText(cccNumberInput, '123');
      await tester.pumpAndSettle();

      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.text(enterAValidCCCNumberText), findsOneWidget);

      await tester.enterText(cccNumberInput, '123456798');
      await tester.pumpAndSettle();

      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(SearchClientPage), findsOneWidget);
    });

    testWidgets('shows loading indicator when making API call',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      store.dispatch(WaitAction<AppState>.add(updateUserProfileFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets('handles api error for code 400', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'errors'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      final Finder saveButton = find.byType(ElevatedButton);
      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);

      await tester.enterText(phoneInput, '0712345679');
      await tester.pumpAndSettle();
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      expect(
        find.text(getErrorMessage("updating user's profile information")),
        findsOneWidget,
      );
    });
    testWidgets('handles api error when the response contains errors',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'errors'}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      final Finder saveButton = find.byType(ElevatedButton);
      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);

      await tester.enterText(phoneInput, '0712345679');
      await tester.pumpAndSettle();
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      expect(
        find.text(getErrorMessage("updating user's profile information")),
        findsOneWidget,
      );
    });
    testWidgets('handles api error when updateProfile is false',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateProfile': false,
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: EditClientProfilePage(
          searchUserResponse: SearchUserResponse(
            clientCCCNumber: '123456789',
            id: 'testID',
            user: UserData(
              id: 'testID',
              primaryContact: Contact(id: 'contactID', value: '0712345678'),
            ),
          ),
        ),
      );

      final Finder saveButton = find.byType(ElevatedButton);
      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);

      await tester.enterText(phoneInput, '0712345679');
      await tester.pumpAndSettle();
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
      expect(
        find.text(getErrorMessage("updating user's profile information")),
        findsOneWidget,
      );
    });
  });
}
