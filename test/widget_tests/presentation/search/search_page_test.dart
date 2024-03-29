import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/caregiver/search_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/client_details/pages/search_client_page.dart';
import 'package:prohealth360_daktari/presentation/client_details/pages/search_staff_member_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Search page', () {
    final Finder clientSearchCardFinder = find.byKey(clientSearchActionCardKey);
    final Finder staffSearchCardFinder = find.byKey(staffSearchActionCardKey);
    final Finder caregiverSearchActionCardFinder = find.byKey(caregiverSearchActionCardKey);

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const SearchPage());

      await tester.pumpAndSettle();
      expect(clientSearchCardFinder, findsOneWidget);
      expect(staffSearchCardFinder, findsOneWidget);
    });

    testWidgets('client search card works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const SearchPage());

      await tester.pumpAndSettle();
      expect(clientSearchCardFinder, findsOneWidget);

      await tester.tap(clientSearchCardFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SearchClientPage), findsOneWidget);
    });

    testWidgets('staff search card works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const SearchPage());

      await tester.pumpAndSettle();
      expect(staffSearchCardFinder, findsOneWidget);

      await tester.tap(staffSearchCardFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SearchStaffMemberPage), findsOneWidget);
    });
    testWidgets('caregiver search card works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(tester: tester, widget: const SearchPage());

      await tester.pumpAndSettle();
      expect(caregiverSearchActionCardFinder, findsOneWidget);

      await tester.ensureVisible(caregiverSearchActionCardFinder);
      await tester.tap(caregiverSearchActionCardFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SearchCaregiverPage), findsOneWidget);
    });
  });
}
