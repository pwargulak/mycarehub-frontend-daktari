import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/presentation/onboarding/program_selection/widgets/programs_widget_list.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/test_helpers.dart';

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
        widget: ProgramsListWidget(
          graphQlClient: mockCustomGraphQlClient,
          programs: <Program>[
            Program(
              id: 'testID',
              name: 'testName',
              active: true,
            )
          ],
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(GeneralWorkstationWidget), findsOneWidget);
    });

    testWidgets('displays a snackbar incase of an error',
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
        widget: ProgramsListWidget(
          graphQlClient: customGraphQlClient,
          programs: <Program>[
            Program(
              id: 'testID',
              name: 'testName',
              active: true,
            )
          ],
        ),
      );
      final Finder primaryButton = find.byType(MyAfyaHubPrimaryButton);
      expect(primaryButton, findsOneWidget);

      await tester.tap(primaryButton);
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
    testWidgets(
        'displays a Snackbar if an error occurs while fetching programs',
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
        widget: ProgramsListWidget(
          graphQlClient: customGraphQlClient,
          programs: <Program>[
            Program(
              id: 'testID',
              name: 'testName',
              active: true,
            )
          ],
        ),
      );
      final Finder primaryButton = find.byType(MyAfyaHubPrimaryButton);
      expect(primaryButton, findsOneWidget);

      await tester.tap(primaryButton);
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
