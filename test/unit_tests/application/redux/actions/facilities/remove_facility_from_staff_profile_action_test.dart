import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/remove_facility_from_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/linked_facilities.dart';

import '../../../../../mocks/mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('RemoveFacilityFromStaffProfileAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      storeTester.dispatch(
        UpdateUserProfileAction(
          linkedFacilities: LinkedFacilities.fromJson(
            <String, dynamic>{'Facilities': mockFacilities},
          ).facilities,
        ),
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        RemoveFacilityFromStaffProfileAction(
          client: MockTestGraphQlClient(),
          staffId: 'testId',
          facilityId: 'bb046fb1-48f3-410f-813c-33a49324e636',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RemoveFacilityFromStaffProfileAction);

      expect(info.state.wait!.isWaitingFor(removeFacilityFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      String testValue = '';
      storeTester.dispatch(
        RemoveFacilityFromStaffProfileAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          staffId: 'testId',
          facilityId: 'testId',
          onFailure: (String message) => testValue = message,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RemoveFacilityFromStaffProfileAction);

      expect(info.state.wait!.isWaitingFor(removeFacilityFlag), false);

      expect(
        testValue,
        getErrorMessage('removing the facility.'),
      );
    });

    test('should throw error if response has error', () async {
      String testValue = '';
      storeTester.dispatch(
        RemoveFacilityFromStaffProfileAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          staffId: 'testId',
          facilityId: 'testId',
          onFailure: (String message) => testValue = message,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(RemoveFacilityFromStaffProfileAction);

      expect(info.state.wait!.isWaitingFor(removeFacilityFlag), false);

      expect(
        testValue,
        getErrorMessage('removing the facility.'),
      );
    });
  });
}
