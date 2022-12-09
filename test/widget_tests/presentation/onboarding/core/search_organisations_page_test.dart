import 'dart:convert';

import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/organisation.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_organisations_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/organisation_list_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_connectivity_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('SearchFacilitiesPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchOrganisationsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomTextField), findsOneWidget);
      expect(find.byType(OrganisationListItem), findsWidgets);
      await tester.tap(find.text('Organization 1'));

      await tester.pumpAndSettle();
      expect(find.byType(SvgPicture), findsWidgets);

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      final Finder searchBtn = find.byType(IconButton);
      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(find.byType(OrganisationListItem), findsNWidgets(3));
    });

    testWidgets('renders correctly with the onSubmit function',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchOrganisationsPage(),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Organization 1'));

      final Finder searchNameFinder = find.byType(CustomTextField);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, '1234');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(OrganisationListItem), findsNWidgets(3));
    });

    testWidgets(
      'should show GenericErrorWidget when there is no content',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'organisations': <dynamic>[]}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: const SearchOrganisationsPage(),
        );
        store.dispatch(
          UpdateOnboardingStateAction(organisations: <Organisation>[]),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);
      },
    );
    testWidgets(
      'should show GenericErrorWidget when there is no content when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'searchFacility': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: const SearchOrganisationsPage(),
        );
        store.dispatch(
          UpdateOnboardingStateAction(organisations: <Organisation>[]),
        );
        await tester.pumpAndSettle();
        final Finder searchNameFinder = find.byType(CustomTextField);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, '1234');

        final Finder searchBtn = find.byType(IconButton);
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();
        store.dispatch(
          UpdateOnboardingStateAction(organisations: <Organisation>[]),
        );
        await tester.pumpAndSettle();
        final Finder searchNotFound = find.byKey(searchNotFoundKey);

        expect(searchNotFound, findsOneWidget);

        await tester.ensureVisible(searchNotFound);
        await tester.tap(searchNotFound);

        await tester.pumpAndSettle();
        store.dispatch(
          UpdateOnboardingStateAction(
            organisations: <Organisation>[
              Organisation.fromJson(<String, dynamic>{
                'id': 'testId',
                'name': 'testName',
                'description': 'testDescription'
              })
            ],
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(OrganisationListItem), findsNWidgets(1));
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
              'data': <String, dynamic>{'searchFacility': <dynamic>[]}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortGraphQlClient,
          widget: const SearchOrganisationsPage(),
        );
        store.dispatch(
          UpdateOnboardingStateAction(organisations: <Organisation>[]),
        );
        await tester.pumpAndSettle();
        store.dispatch(
          UpdateOnboardingStateAction(organisations: <Organisation>[]),
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
      store.dispatch(WaitAction<AppState>.add(fetchOrganisationsFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const SearchOrganisationsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
