import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_organisation_field.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('Search OrganisationField', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
      );
    });
    testWidgets('Icon Button works correctly', (WidgetTester tester) async {
      String testValue = '';
      await buildTestWidget(
        store: store,
        tester: tester,
        widget: SearchOrganisationField(
          onChanged: (String organisationCode) => testValue = organisationCode,
          onFieldCleared: () {},
        ),
        graphQlClient: MockTestGraphQlClient(),
      );
      await tester.pumpAndSettle();

      final Finder organizationSearchField =
          find.byKey(organisationSelectOptionFieldKey);
      final Finder saveOrganisationBtnFinder =
          find.byKey(saveOrganisationBtnKey);

      final Finder searchOrganisationIconBtnFinder =
          find.byKey(searchOrganisationconBtnKey);

      expect(organizationSearchField, findsOneWidget);
      await tester.tap(organizationSearchField);

      await tester.pumpAndSettle();
      await tester.tap(find.text('Organisation SI THREE').last);
      await tester.pumpAndSettle();
      await tester.tap(saveOrganisationBtnFinder);
      await tester.pumpAndSettle();

      expect(store.state.userProfileState?.organizationState?.selectedOrganisation?.name, 'Organisation SI THREE');
      expect(
        find.text(
          store.state.userProfileState?.organizationState?.selectedOrganisation
                  ?.name ?? '',
        ),
        findsOneWidget,
      );

      await tester.tap(searchOrganisationIconBtnFinder);
      await tester.pumpAndSettle();
      expect(find.text('Organisation SI THREE'), findsNothing);

      await tester.tap(searchOrganisationIconBtnFinder);
      await tester.pumpAndSettle();
      expect(find.text('Organisation SI THREE'), findsOneWidget);
      expect(testValue, 'some-id');
    });
  });
}
