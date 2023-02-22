import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/organization_list_item_widget.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/custom_text_field.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/generic_error_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  group('Manage Organization Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();
       expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(createOrganizationButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(CreateOrganizationPage), findsOneWidget);
    });

    testWidgets('navigates to details page correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();
     
      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byType(OrganizationListItem).first);
      await tester.pumpAndSettle();
      expect(find.byType(OrganizationDetailPage), findsOneWidget);
    });

    testWidgets('search organisation works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(searchOrganizationButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(2));
    });

    testWidgets('search organisation works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ManageOrganizationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(3));

      await tester.tap(find.byKey(searchOrganizationButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(OrganizationListItem), findsNWidgets(2));
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
              'data': <String, dynamic>{'listOrganisations': <String, dynamic>{'organisations': <dynamic>[]}}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const ManageOrganizationPage(),
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
      'should show GenericErrorWidget when there is no content and not searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'listOrganisations': <String, dynamic>{'organisations': <dynamic>[]}}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          widget: const ManageOrganizationPage(),
        );
        await tester.pumpAndSettle();
        final Finder noDataWidget = find.byKey(helpNoDataWidgetKey);

        expect(noDataWidget, findsOneWidget);
        await tester.tap(noDataWidget);
        expect(noDataWidget, findsOneWidget);
      },
    );
  });
}
