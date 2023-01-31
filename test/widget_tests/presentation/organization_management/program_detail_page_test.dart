import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/badge_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/deactivate_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Program Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ProgramDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BadgeWidget), findsNWidgets(4));
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      expect(find.byType(DeactivateWidget), findsOneWidget);

      await tester.tap(find.byKey(cancelButtonKey).first);
      await tester.tap(find.byKey(cancelButtonKey).last);
      await tester.pumpAndSettle();
      //TODO(Byron) Add more expectations when backend data is available
    });

    testWidgets('add facility button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ProgramDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BadgeWidget), findsNWidgets(4));
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      expect(find.byType(DeactivateWidget), findsOneWidget);

      await tester.ensureVisible(find.byKey(addFacilityButtonKey));
      await tester.tap(find.byKey(addFacilityButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(SearchFacilitiesPage), findsOneWidget);
    });
  });
}
