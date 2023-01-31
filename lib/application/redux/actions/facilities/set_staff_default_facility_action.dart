import 'dart:async';

import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SetStaffDefaultFacilityAction extends ReduxAction<AppState> {
  SetStaffDefaultFacilityAction({
    required this.client,
    this.onFailure,
    required this.facilityId,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String facilityId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setDefaultFacilityFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(setDefaultFacilityFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'facilityID': facilityId,
      'staffID': state.userProfileState?.userProfile?.id
    };

    final Response response = await client.query(
      setStaffDefaultFacilityMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: errorSelectingDefaultFacility,
          query: setStaffDefaultFacilityMutation,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        throw UserException(getErrorMessage('selecting facility'));
      }
      final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
      if ((data['setStaffDefaultFacility'] as Map<String, dynamic>)['id'] ==
          facilityId) {
        dispatch(
          UpdateUserProfileAction(
            defaultFacility: Facility(id: facilityId),
          ),
        );
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.homePage,
            (Route<dynamic> route) => false,
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }
    return null;
  }
}
