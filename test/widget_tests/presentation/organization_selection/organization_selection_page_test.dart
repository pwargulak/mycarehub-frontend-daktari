import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/general_workstation_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/organization_selection_page.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  group('Organization Selection Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const OrganizationSelectionPage(),
      );

      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));
    });
  });
}
