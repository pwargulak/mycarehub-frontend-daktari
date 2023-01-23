import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_view_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/delete_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/list_item_with_cancel.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Organization Detail View Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationDetailViewPage(),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('OrganizationImage')), findsOneWidget);
      expect(find.byType(ListItemWithCancelButton), findsNWidgets(2));
      expect(find.byType(DeleteWidget), findsOneWidget);
      
    });
  });
}
