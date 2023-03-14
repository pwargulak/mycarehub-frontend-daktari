import 'dart:convert';

import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/caregiver/assign_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/client_caregivers_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/search_caregiver_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('AssignCaregiverPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      final Finder searchCaregiverItem = find.byType(SearchCaregiverItem);

      expect(searchCaregiverItem, findsOneWidget);
    });

    testWidgets('renders correctly with the onSubmit function',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder searchCaregiverItem = find.byType(SearchCaregiverItem);

      expect(searchCaregiverItem, findsOneWidget);
    });

    testWidgets('should save selected caregiver item',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ClientCaregiversWidget(id: 'test', userName: 'caregiver'),
      );

      final Finder buttonAddCaregiver = find.text(addCaregiverText);
      expect(buttonAddCaregiver, findsOneWidget);

      await tester.tap(buttonAddCaregiver);
      await tester.pumpAndSettle();

      expect(find.byType(AssignCaregiverPage), findsOneWidget);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder searchCaregiverItem = find.byType(SearchCaregiverItem);

      expect(searchCaregiverItem, findsOneWidget);
      await tester.tap(searchCaregiverItem);
      await tester.pumpAndSettle();

      expect(searchCaregiverItem, findsOneWidget);

      final Finder saveButton = find.byKey(saveCaregiverBtnKey);
      expect(saveButton, findsOneWidget);

      await tester.tap(saveButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should select caregiver', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder searchCaregiverItem = find.byType(SearchCaregiverItem);

      expect(searchCaregiverItem, findsOneWidget);
      await tester.tap(searchCaregiverItem);
      await tester.pumpAndSettle();
      expect(searchCaregiverItem, findsOneWidget);

      
    });

    testWidgets('should show error if no internet connection',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: false),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });

    testWidgets('renders correctly with the CustomTextField onSubmit function',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(SearchCaregiverItem), findsOneWidget);
    });

    testWidgets('Shows loading indicator when fetching client',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(searchCaregiverFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there is no content when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchCaregiverUser': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const AssignCaregiverPage(
            clientId: 'test',
          ),
        );
        await tester.pumpAndSettle();
        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, '1234');

        final Finder searchBtn = find.byType(IconButton);
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();

        final Finder retryButton = find.text('Retry');
        expect(retryButton, findsOneWidget);
        await tester.tap(retryButton);
        await tester.pumpAndSettle();
        expect(find.byType(GenericErrorWidget), findsOneWidget);
      },
    );

    testWidgets(
      'should show GenericErrorWidget when there is no content and is not searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchCaregiverUser': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const AssignCaregiverPage(
            clientId: 'test',
          ),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
  });

  testWidgets(
    'should show GenericErrorWidget when there is content when searching',
    (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'searchCaregiverUser': <dynamic>[]}
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );
      await tester.pumpAndSettle();
      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      final Finder retryButton = find.text('Retry');
      expect(retryButton, findsOneWidget);
      await tester.tap(retryButton);
      await tester.pumpAndSettle();
      expect(find.byType(GenericErrorWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should show GenericErrorWidget when there is no data',
    (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'searchCaregiverUser': <dynamic>[]}
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: mockShortGraphQlClient,
        widget: const AssignCaregiverPage(
          clientId: 'test',
        ),
      );
      await tester.pumpAndSettle();

      final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

      expect(genericNoDataButton, findsOneWidget);
      await tester.tap(genericNoDataButton);
      expect(genericNoDataButton, findsOneWidget);
    },
  );
}
