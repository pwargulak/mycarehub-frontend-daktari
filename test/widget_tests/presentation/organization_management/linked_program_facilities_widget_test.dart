import 'dart:convert';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/linked_program_facilities_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('LinkedProgramFacilitiesWidget', () {
  testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const LinkedProgramFacilitiesWidget(
          programId: 'testID',
        ),
      );

      await tester.pumpAndSettle();
      final Finder addFacilityButton = find.byKey(addFacilityButtonKey);
      expect(find.byType(ListCardWithCancelButton), findsNWidgets(2));
      expect(addFacilityButton, findsOneWidget);

      await tester.tap(addFacilityButton);
      await tester.pumpAndSettle();
      expect(find.byType(SearchFacilitiesPage), findsOneWidget);
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
          widget: const LinkedProgramFacilitiesWidget(
            programId: 'testID',
          ),
        );

        await tester.pumpAndSettle();
        expect(
          find.text(getErrorMessage('facilities linked to this program')),
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
          widget: const LinkedProgramFacilitiesWidget(
            programId: 'testID',
          ),
        );
        await tester.pumpAndSettle();
        expect(
          find.text(getErrorMessage('facilities linked to this program')),
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
        widget: const LinkedProgramFacilitiesWidget(
          programId: 'testID',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
