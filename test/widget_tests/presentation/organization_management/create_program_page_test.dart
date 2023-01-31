import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/list_item_with_cancel.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Create Program Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const CreateProgramPage(),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('ProgramImage')), findsOneWidget);
      expect(find.byType(ListItemWithCancelButton), findsNWidgets(3));
    });
  });
}
