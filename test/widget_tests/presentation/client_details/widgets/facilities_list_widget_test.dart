import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/list_card_with_cancel_button.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/facilities_list_widget.dart';

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
        widget: const FacilitiesListWidget(
          userID: 'testID',
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
          widget: const FacilitiesListWidget(
            userID: 'testID',
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
          widget: const FacilitiesListWidget(
            userID: 'testID',
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
        widget: const FacilitiesListWidget(
          userID: 'testID',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
