import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/set_staff_default_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/linked_facilities.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  group('SetStaffDefaultFacilityAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      storeTester.dispatch(
        UpdateStaffProfileAction(
          linkedFacilities: LinkedFacilities.fromJson(
            <String, dynamic>{'Facilities': mockFacilities},
          ).facilities,
        ),
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        SetStaffDefaultFacilityAction(
          client: MockTestGraphQlClient(),
          facilityId: 'bb046fb1-48f3-410f-813c-33a49324e636',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetStaffDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(setDefaultFacilityFlag), false);
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        SetStaffDefaultFacilityAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
          facilityId: 'testId',
          onFailure: (String message) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetStaffDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(removeFacilityFlag), false);

      expect((info.error! as UserException).msg, getErrorMessage());
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        SetStaffDefaultFacilityAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
          facilityId: 'testId',
          onFailure: (String message) {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(SetStaffDefaultFacilityAction);

      expect(info.state.wait!.isWaitingFor(setDefaultFacilityFlag), false);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('selecting facility'),
      );
    });
  });
}
