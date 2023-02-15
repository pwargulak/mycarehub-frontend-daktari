import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Manage Program Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(CustomTextField), findsOneWidget);

      final Finder createProgramFinder = find.byKey(createProgramButtonKey);
      final Finder programListItemFinder = find.byType(ProgramListItem);

      expect(programListItemFinder, findsNWidgets(2));

      await tester.ensureVisible(createProgramFinder);
      await tester.tap(createProgramFinder.first);
      await tester.pumpAndSettle();

      expect(find.byType(CreateProgramPage), findsOneWidget);
    });

    testWidgets('navigates to detail page correctly',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(CustomTextField), findsOneWidget);

      expect(find.byType(ProgramListItem), findsNWidgets(2));
      await tester.tap(find.byType(ProgramListItem).first);

      await tester.pumpAndSettle();
      expect(find.byType(ProgramDetailPage), findsOneWidget);
    });
    testWidgets(
        'displays error if there is no internet connection when fetching programs by search',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      await tester.pumpAndSettle();
      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });
    testWidgets(
        'displays error if there is no internet connection when fetching programs',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });
    testWidgets('renders correctly with the onSubmit function',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );
      await tester.pumpAndSettle();
      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'pro');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(ProgramListItem), findsNWidgets(2));
    });
    testWidgets(
        'displays error if there is no internet connection when fetching programs by search using onSubmit',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      await tester.pumpAndSettle();
      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text(connectionLostText), findsOneWidget);
    });
    testWidgets(
      'should show GenericErrorWidget when there is no program',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchPrograms': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const ManageProgramsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should show GenericErrorWidget when there is no program when searching',
      (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
        tester.binding.window.devicePixelRatioTestValue = 1;
        TestWidgetsFlutterBinding.ensureInitialized();
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchPrograms': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const ManageProgramsPage(),
        );
        await tester.pumpAndSettle();
        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, 'pro');

        final Finder searchBtn = find.byType(IconButton);
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
        final Finder searchNotFound = find.byKey(searchNotFoundKey);

        expect(searchNotFound, findsOneWidget);

        store.dispatch(UpdateConnectivityAction(hasConnection: false));

        await tester.ensureVisible(searchNotFound);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
        await tester.tap(searchNotFound);
        await tester.pumpAndSettle();
        expect(find.text(connectionLostText), findsOneWidget);
        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });
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
              'data': <String, dynamic>{'searchPrograms': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const ManageProgramsPage(),
        );
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
        await tester.tap(genericNoDataButton);
        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets('Shows loading indicator when fetching members',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchProgramsFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageProgramsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
