import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/deactivate_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Organization Detail Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProgramListItem), findsNWidgets(2));
      expect(find.byType(DeactivateWidget), findsOneWidget);
    });
  });
}
