import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_details_view_page.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/client_search_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/staff_search_widget.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/active_client_actions.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/active_staff_actions.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/search_details_information_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  Store<AppState> store = Store<AppState>(initialState: AppState.initial());

  group('Search Detail View Page', () {
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
      store.dispatch(
        UpdateUserProfileAction(
          currentFacility: Facility(id: 'testID', name: 'TestName'),
        ),
      );
    });
    group('for active user', () {
      testWidgets('renders correctly', (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

        final Finder addFacilityButton = find.byKey(addFacilityButtonKey);
        expect(addFacilityButton, findsOneWidget);

        await tester.ensureVisible(addFacilityButton);
        await tester.pumpAndSettle();
        await tester.tap(addFacilityButton);
        await tester.pumpAndSettle();
        expect(find.byType(SearchFacilitiesPage), findsOneWidget);
      });

      testWidgets(
          'renders loading indicator correctly when searching for staff member',
          (WidgetTester tester) async {
        store = Store<AppState>(
          initialState: AppState.initial(),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          store: store,
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );
        store.dispatch(WaitAction<AppState>.add(searchStaffMemberFlag));

        await tester.pump();
        expect(find.byType(PlatformLoader), findsOneWidget);
      });

      testWidgets('renders correctly for staff', (WidgetTester tester) async {
        store = Store<AppState>(
          initialState: AppState.initial(),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );
        store.dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse: SearchUserResponse(
              user: UserData.initial(),
              staffNumber: '123',
              id: '123',
            ),
          ),
        );

        await tester.pumpAndSettle();
        await tester.pumpAndSettle(const Duration(seconds: 10));

        expect(find.byType(StaffSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
      });

      testWidgets('renders correctly for staff without roles',
          (WidgetTester tester) async {
        store = Store<AppState>(
          initialState: AppState.initial(),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );
        store.dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse: SearchUserResponse(
              user: UserData.initial(),
              staffNumber: '123',
              id: '123',
            ),
          ),
        );

        await tester.pumpAndSettle();
        await tester.pumpAndSettle(const Duration(seconds: 10));

        expect(find.byType(StaffSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
      });

      testWidgets('invite button works correctly for clients',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveClientActions), findsOneWidget);

        await tester.tap(find.byKey(sendClientInviteButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('reinvite button works correctly for clients',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveClientActions), findsOneWidget);

        await tester.ensureVisible(find.byKey(resendClientInviteButtonKey));

        await tester.tap(find.byKey(resendClientInviteButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('invite client button shows snackbar when there is an error',
          (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'searchClientUser': <dynamic>[
                  <String, dynamic>{
                    'ID': 'some-id',
                    'CCCNumber': '1234',
                    'Active': true,
                    'User': <String, dynamic>{
                      'ID': 'some-id',
                      'Username': 'Username',
                      'Active': false,
                      'TermsAccepted': false,
                      'Contacts': <String, dynamic>{
                        'ContactType': 'PHONE',
                        'ContactValue': '07000000',
                        'Active': false,
                        'OptedIn': false,
                      }
                    }
                  }
                ],
                'getSharedHealthDiaryEntries': <dynamic>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'mood': 'HAPPY',
                    'note': 'I am healthy',
                    'sharedAt': '2021-11-30T16:17:57Z',
                    'active': true,
                  }
                ],
                'getUserLinkedFacilities': <String, dynamic>{
                  'Facilities': <dynamic>[mockFacilities.first]
                }
              }
            }),
            200,
          ),
        );
        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveClientActions), findsOneWidget);

        await tester.ensureVisible(find.byKey(resendClientInviteButtonKey));

        await tester.tap(find.byKey(resendClientInviteButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('handles api error when invite client button is tapped',
          (WidgetTester tester) async {
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
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

        await tester.tap(find.byKey(resendClientInviteButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsNothing);
      });

      testWidgets('invite staff button shows snackbar when there is an error',
          (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'data': clientResponseMock}),
            200,
          ),
        );
        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(StaffSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveStaffActions), findsOneWidget);

        await tester.tap(find.byKey(inviteStaffButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('handles api error when invite staff button is tapped',
          (WidgetTester tester) async {
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
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(StaffSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveStaffActions), findsOneWidget);

        await tester.tap(find.byKey(inviteStaffButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsNothing);
      });

      testWidgets('staff invite button works correctly',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byKey(inviteStaffButtonKey), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveStaffActions), findsOneWidget);

        await tester.tap(find.byKey(inviteStaffButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('staff reinvite button works correctly',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse: SearchUserResponse.initial(),
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byKey(reinviteStaffButtonKey), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);
        expect(find.byType(ActiveStaffActions), findsOneWidget);

        await tester.ensureVisible(find.byKey(reinviteStaffButtonKey));

        await tester.tap(find.byKey(reinviteStaffButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    group('for deactivated user', () {
      testWidgets('reactivate user button works correctly',
          (WidgetTester tester) async {
        store.dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse:
                SearchUserResponse.initial().copyWith(isActive: false),
          ),
        );
        await buildTestWidget(
          store: store,
          tester: tester,
          graphQlClient: MockTestGraphQlClient(),
          widget: SearchPageDetailView(
            searchUserResponse:
                SearchUserResponse.initial().copyWith(isActive: false),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ClientSearchWidget), findsOneWidget);
        expect(find.byType(SearchDetailsInformationWidget), findsOneWidget);

        await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
        await tester.pumpAndSettle();

        expect(
          find.text('$UNKNOWN $reactivatedSuccessfullyString'),
          findsOneWidget,
        );
        expect(find.byType(SnackBar), findsOneWidget);
      });

      testWidgets('handles api error when reactivate user button is tapped',
          (WidgetTester tester) async {
        store.dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse:
                SearchUserResponse.initial().copyWith(isActive: true),
          ),
        );
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
          store: store,
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () => clientSearchAction(
                  context: context,
                  selectedSearchUserResponse:
                      SearchUserResponse.initial().copyWith(isActive: false),
                ),
                child: const Text('test'),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder sendClientInviteButton = find.byType(ElevatedButton);

        expect(sendClientInviteButton, findsOneWidget);

        await tester.ensureVisible(sendClientInviteButton);

        await tester.pumpAndSettle();

        await tester.tap(sendClientInviteButton);
        await tester.pumpAndSettle();
        expect(
          find.text('$errorWhileReactivatingString $UNKNOWN'),
          findsOneWidget,
        );
        expect(find.byType(SnackBar), findsOneWidget);
      });

      testWidgets('renders loading indicator correctly',
          (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getSharedHealthDiaryEntries': <dynamic>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'mood': 'HAPPY',
                    'note': 'I am healthy',
                    'sharedAt': '2021-11-30T16:17:57Z',
                    'active': true,
                  }
                ]
              }
            }),
            200,
          ),
        );
        store.dispatch(WaitAction<AppState>.add(reactivateClientFlag));
        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: SearchPageDetailView(
            searchUserResponse:
                SearchUserResponse.initial().copyWith(isActive: false),
          ),
        );

        expect(find.byType(PlatformLoader), findsNWidgets(3));
      });
    });
  });
}
