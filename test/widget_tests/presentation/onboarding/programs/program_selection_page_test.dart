import 'dart:convert';
import 'package:prohealth360_daktari/presentation/onboarding/program_selection/program_selection_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Program Selection Page', () {
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
        graphQlClient: MockCustomGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, dynamic>{
              'data': <String, dynamic>{
                'listUserPrograms': <String, dynamic>{
                  'count': 1,
                  'programs': <dynamic>[
                    <String, dynamic>{
                      'id': 'testId',
                      'name': 'testName',
                      'active': true,
                      'organisation': <String, dynamic>{
                        'id': 'testOrgId',
                        'description': 'testOrgDescription',
                      },
                    }
                  ],
                }
              }
            }),
            201,
          ),
        ),
        widget: ProgramSelectionPage(),
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
      store.dispatch(WaitAction<AppState>.add(fetchUserProgramsFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockCustomGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, dynamic>{
              'data': <String, dynamic>{
                'listUserPrograms': <String, dynamic>{
                  'programs': <dynamic>[],
                }
              }
            }),
            201,
          ),
        ),
        widget: ProgramSelectionPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('displays snackbar incase of an error',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockCustomGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, String>{'error': 'error occurred'}),
            500,
          ),
        ),
        widget: ProgramSelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
    testWidgets('displays an error occurs while fetching programs',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockCustomGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, String>{'error': 'error occurred'}),
            201,
          ),
        ),
        widget: ProgramSelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
