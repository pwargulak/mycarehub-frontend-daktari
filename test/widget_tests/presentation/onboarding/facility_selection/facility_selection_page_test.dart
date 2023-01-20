import 'dart:convert';

import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/onboarding/facility_selection/facility_selection_page.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Facility Selection Page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
       store.dispatch(
        UpdateUserProfileAction(
          defaultFacility: Facility(id: 'testId'),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GeneralWorkstationWidget), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('renders loader correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(WaitAction<AppState>.add(fetchProgramFacilitiesFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: FacilitySelectionPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('shows no facility widget when there are no facilities',
        (WidgetTester tester) async {
      final MockShortGraphQlClient customGraphQlClient =
          MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'getStaffFacilities': <String, dynamic>{
                'facilities' : <dynamic>[]
              },
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: customGraphQlClient,
        widget: FacilitySelectionPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(noProgramFacilitiesString), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('displays error widget incase of an error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient customGraphQlClient =
          MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, String>{'error': 'error occurred'}),
          500,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: customGraphQlClient,
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GenericErrorWidget), findsOneWidget);

      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();
      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });

    testWidgets(
        'displays an error widget if an error occurs while fetching programs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient customGraphQlClient =
          MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, String>{'error': 'error occurred'}),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: customGraphQlClient,
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
