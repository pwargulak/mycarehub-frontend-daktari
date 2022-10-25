import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/update_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/caregiver/search_caregiver_details_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/search_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/search_caregiver_item.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SearchCaregiverPage', () {
    testWidgets('should show error if no internet connection',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateCaregiverAction(caregivers: <Caregiver>[Caregiver.initial()]),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchCaregiverPage(),
      );

      final Finder searchNameFinder = find.byType(CustomTextField);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateConnectivityAction(hasConnection: true),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchCaregiverPage(),
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
      await tester.tap(searchCaregiverItem);
      
      await tester.pumpAndSettle();
      expect(find.byType(SearchCaregiverDetailsPage), findsOneWidget);
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
        widget: const SearchCaregiverPage(),
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
        widget: const SearchCaregiverPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets(
      'should show GenericErrorWidget when there are no caregivers',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchCaregiverUser': <dynamic>[]},
            }),
            201,
          ),
        );

        store.dispatch(
          UpdateConnectivityAction(hasConnection: true),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const SearchCaregiverPage(),
        );

        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, '1234');
        await tester.pump();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byType(GenericErrorWidget);
        expect(genericNoDataButton, findsOneWidget);
      },
    );
  });
}
