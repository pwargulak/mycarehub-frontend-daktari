import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/phase_two/presentation/search/widgets/linked_facilities_widget.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/list_card_with_cancel_button.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('FacilitiesListWidget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const LinkedFacilitiesWidget(
          userId: 'testID',
          userName: 'testUserName',
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ListCardWithCancelButton), findsNWidgets(2));
    });

    testWidgets(
      'should show an error message when an error occurs',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
          ),
        );

        await tester.pumpAndSettle();
        expect(
          find.text(getErrorMessage('facilities linked to this user')),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      'should show an error message when there is a bad request',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            400,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
          ),
        );
        await tester.pumpAndSettle();
        expect(
          find.text(getErrorMessage('facilities linked to this user')),
          findsOneWidget,
        );
      },
    );

    testWidgets('should show a loading indicator when adding facility',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      store.dispatch(
        WaitAction<AppState>.add(retrieveFacilityFlag),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const LinkedFacilitiesWidget(
          userId: 'testID',
          userName: 'testUserName',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    group('Removes facility', () {
      testWidgets('works correctly for client', (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
          ),
        );

        await tester.pumpAndSettle();
        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsNWidgets(2));

        await tester.tap(cancelButton.first);
        await tester.pumpAndSettle();
        expect(find.text(removedFacilitySuccessString), findsOneWidget);
      });
      testWidgets('works correctly for staff', (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsNWidgets(2));

        await tester.tap(cancelButton.first);
        await tester.pumpAndSettle();
        expect(find.text(removedFacilitySuccessString), findsOneWidget);
      });
      testWidgets(' from staff shows snackbar when there is an error',
          (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getUserLinkedFacilities': <String, dynamic>{
                  'Facilities': mockFacilities
                },
                'removeFacilitiesFromStaffProfile': false
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
            isClient: false,
          ),
        );

        await tester.pumpAndSettle();
        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsNWidgets(2));

        await tester.tap(cancelButton.first);
        await tester.pumpAndSettle();

        expect(
          find.text(getErrorMessage('removing the facility.')),
          findsOneWidget,
        );
      });
      testWidgets(' from client shows snackbar when there is an error',
          (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getUserLinkedFacilities': <String, dynamic>{
                  'Facilities': mockFacilities
                },
                'removeFacilitiesFromClientProfile': false
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
          ),
        );

        await tester.pumpAndSettle();
        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsNWidgets(2));

        await tester.tap(cancelButton.first);
        await tester.pumpAndSettle();

        expect(
          find.text(getErrorMessage('removing the facility.')),
          findsOneWidget,
        );
      });
      testWidgets('should show a loading indicator',
          (WidgetTester tester) async {
        store.dispatch(
          WaitAction<AppState>.add(
            'bb046fb1-48f3-410f-813c-33a49324e636_$removeFacilityFlag',
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: const LinkedFacilitiesWidget(
            userId: 'testID',
            userName: 'testUserName',
          ),
        );

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
  });
}
