import 'dart:convert';

import 'package:prohealth360_daktari/presentation/admin/admin_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/create_room_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/caregiver/register_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/appbar_user.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_page.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

void main() {
  group('HomePage', () {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'getContent': <String, dynamic>{
              'items': <dynamic>[
                contentMock.first,
                documentContentMock,
              ]
            },
          },
        }),
        201,
      ),
    );
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('navigates to add new patient page',
        (WidgetTester tester) async {
      final String firstName =
          store.state.userProfileState?.userProfile?.user?.name ?? UNKNOWN;
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return StoreProvider<AppState>(
              store: store,
              child: const HomePage(),
            );
          },
        ),
      );

      final Finder addNewUserWidget = find.text(addNewClientText);

      expect(find.byType(AppbarUser), findsOneWidget);
      expect(
        find.text(
          removeTailingComma(
            getGreetingMessage(
              firstName == UNKNOWN ? '' : firstName,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(find.byType(ActionCard), findsWidgets);

      await tester.ensureVisible(addNewUserWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.text(addNewClientText));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterClientPage), findsWidgets);
    });

    testWidgets('navigates to ServiceRequestsPage',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getServiceRequests': <dynamic>[]}
          }),
          201,
        ),
      );

      const String firstName = 'Laura';

      store.dispatch(
        UpdateUserAction(user: User.initial().copyWith(firstName: firstName)),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: StoreProvider<AppState>(
          store: store,
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      final Finder serviceRequestsWidget = find.text(serviceRequestsText);
      final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

      await tester.ensureVisible(serviceRequestsWidget);
      await tester.pumpAndSettle();
      await tester.tap(serviceRequestsWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsWidgets);
      expect(genericNoDataButton, findsOneWidget);
      await tester.tap(genericNoDataButton);
      await tester.pumpAndSettle();
      expect(find.byType(ServiceRequestsPage), findsNothing);
    });

    testWidgets('navigates to add new staff page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
      );

      final Finder addStaffWidget = find.text(addNewStaffText);
      await tester.ensureVisible(addStaffWidget);
      await tester.pumpAndSettle();
      await tester.tap(addStaffWidget);
      await tester.pumpAndSettle();
      expect(find.byType(AddNewStaffPage), findsWidgets);
    });

    testWidgets('navigates to add new caregiver page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
      );

      final Finder addCaregiverWidget = find.text(addCaregiverText);
      await tester.ensureVisible(addCaregiverWidget);
      await tester.pumpAndSettle();
      await tester.tap(addCaregiverWidget);
      await tester.pumpAndSettle();
      expect(find.byType(RegisterCaregiverPage), findsWidgets);
    });

    testWidgets('navigates to search page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
      );

      final Finder searchActionCardFinder = find.byKey(searchActionCardKey);

      await tester.ensureVisible(searchActionCardFinder);
      await tester.pumpAndSettle();
      await tester.tap(searchActionCardFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsWidgets);
    });

    testWidgets('navigates to surveys page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
      );

      final Finder surveysCardFinder = find.byKey(surveysCardKey);

      await tester.ensureVisible(surveysCardFinder);
      await tester.pumpAndSettle();
      await tester.tap(surveysCardFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SurveysPage), findsOneWidget);
    });

    testWidgets('navigates to faqs page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
        graphQlClient: mockShortSILGraphQlClient,
      );

      final Finder faqCardFinder = find.byKey(faqsCardKey);

      await tester.ensureVisible(faqCardFinder);
      await tester.pumpAndSettle();
      await tester.tap(faqCardFinder);
      await tester.pumpAndSettle();
      expect(find.byType(ProfileFaqsPage), findsOneWidget);
    });

    testWidgets('navigates to admin page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
        graphQlClient: mockShortSILGraphQlClient,
      );

      final Finder adminCardFinder = find.byKey(adminCardKey);

      await tester.ensureVisible(adminCardFinder);
      await tester.pumpAndSettle();
      await tester.tap(adminCardFinder);
      await tester.pumpAndSettle();
      expect(find.byType(AdminPage), findsOneWidget);
    });
    testWidgets('navigates to Create Room Page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: const HomePage(),
        graphQlClient: mockShortSILGraphQlClient,
      );

      final Finder createGroupFinder = find.byKey(createGroupKey);

      await tester.ensureVisible(createGroupFinder);
      await tester.pumpAndSettle();
      await tester.tap(createGroupFinder);
      await tester.pumpAndSettle();
      expect(find.byType(CreateRoomPage), findsOneWidget);
    });
  });
}
