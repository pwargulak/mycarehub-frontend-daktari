import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/roles_list.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/staff_search_widget.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/search_user_item.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('Search User Item', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        widget: SearchUserItem(
          searchUserResponse: SearchUserResponse(
            defaultFacility: Facility.initial(),
            id: UNKNOWN,
            isActive: true,
            rolesList: RolesList.initial(),
            staffNumber: UNKNOWN,
            user: UserData.initial(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(SearchUserItem));
      await tester.pumpAndSettle();

      expect(find.byType(StaffSearchWidget), findsOneWidget);
    });
  });
}
