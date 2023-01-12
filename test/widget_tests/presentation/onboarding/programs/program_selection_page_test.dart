import 'dart:convert';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
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

    final MockCustomGraphQlClient mockCustomGraphQlClient =
        MockCustomGraphQlClient.withResponse(
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
            },
            'setStaffProgram': <String, dynamic>{
              'staffProfile': <String, dynamic>{
                'ID': 'testID',
                'StaffNumber': 'testStaffNumber',
                'DefaultFacility': <String, dynamic>{
                  'ID': 'testID',
                  'name': 'testName',
                  'Username': 'testUserName',
                  'Active': true,
                  'Gender': 'male'
                },
                'User': <String, dynamic>{'ID': 'testID', 'Name': 'testName'}
              },
              'communityToken': 'testToken'
            },
          }
        }),
        201,
      ),
    );

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockCustomGraphQlClient,
        widget: ProgramSelectionPage(
          graphQlClient: mockCustomGraphQlClient,
        ),
      );

      await tester.pumpAndSettle();

      final Finder primaryButton = find.byType(MyAfyaHubPrimaryButton);

      expect(find.byType(GeneralWorkstationWidget), findsOneWidget);
      expect(primaryButton, findsOneWidget);

      await tester.tap(primaryButton);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('renders loader correctly', (WidgetTester tester) async {
      final MockCustomGraphQlClient customGraphQlClient =
          MockCustomGraphQlClient.withResponse(
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
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(WaitAction<AppState>.add(fetchUserProgramsFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: customGraphQlClient,
        widget: ProgramSelectionPage(
          graphQlClient: customGraphQlClient,
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets('renders loader correctly when setting user program',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      store.dispatch(WaitAction<AppState>.add(setUserProgramFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockCustomGraphQlClient,
        widget: ProgramSelectionPage(
          graphQlClient: mockCustomGraphQlClient,
        ),
      );
      store.dispatch(WaitAction<AppState>.remove(fetchUserProgramsFlag));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets('shows no program widget when there are no programs',
        (WidgetTester tester) async {
      final MockCustomGraphQlClient customGraphQlClient =
          MockCustomGraphQlClient.withResponse(
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
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: customGraphQlClient,
        widget: ProgramSelectionPage(
          graphQlClient: customGraphQlClient,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(noProgramsString), findsOneWidget);
      await tester.tap(find.text(logoutButtonText));
      await tester.pumpAndSettle();
    });

    testWidgets('displays error widget incase of an error',
        (WidgetTester tester) async {
      final MockCustomGraphQlClient customGraphQlClient =
          MockCustomGraphQlClient.withResponse(
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
        widget: ProgramSelectionPage(
          graphQlClient: customGraphQlClient,
        ),
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
      final MockCustomGraphQlClient customGraphQlClient =
          MockCustomGraphQlClient.withResponse(
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
        widget: ProgramSelectionPage(
          graphQlClient: customGraphQlClient,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
    });
  });
}
