import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/phase_two/presentation/facility_selection_page.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/general_workstation_widget.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Facility Selection Page', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('renders loader correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(WaitAction<AppState>.add(setDefaultFacilityFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: FacilitySelectionPage(),
      );
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('displays snackbar incase of an error',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, String>{'error': 'error occurred'}),
            500,
          ),
        ),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(' navigates to home page correctly when there is no facility',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getUserLinkedFacilities': <String, dynamic>{
                  'Facilities': <dynamic>[]
                }
              }
            }),
            201,
          ),
        ),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets(' navigates to home page correctly when there is one facility',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getUserLinkedFacilities': <String, dynamic>{
                  'Facilities': <dynamic>[mockFacilities.first]
                },
                'setStaffDefaultFacility': true,
              }
            }),
            201,
          ),
        ),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
