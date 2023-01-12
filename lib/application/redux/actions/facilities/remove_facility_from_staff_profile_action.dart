import 'dart:async';

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
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class RemoveFacilityFromStaffProfileAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final VoidCallback? onSuccess;
  final String staffId;
  final String facilityId;

  RemoveFacilityFromStaffProfileAction({
    required this.client,
    this.onFailure,
    this.onSuccess,
    required this.staffId,
    required this.facilityId,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add('${facilityId}_$removeFacilityFlag'));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove('${facilityId}_$removeFacilityFlag'));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'staffID': staffId,
      'facilities': <dynamic>[facilityId],
    };

    final Response response = await client.query(
      removeFacilitiesFromStaffProfileMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: removeStaffFacilityErrorString,
          query: removeFacilitiesFromStaffProfileMutation,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('removing the facility.'));
        return null;
      }

      final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
      if ((data['removeFacilitiesFromStaffProfile'] as bool?) ?? false) {
        final List<Facility> linkedFacilities = state
            .userProfileState!.userProfile!.linkedFacilities!
            .where((Facility facility) => facility.id != facilityId)
            .toList();
        dispatch(
          UpdateUserProfileAction(linkedFacilities: linkedFacilities),
        );
        onSuccess?.call();
        return state;
      } else {
        reportErrorToSentry(
          hint: removeStaffFacilityErrorString,
          query: removeFacilitiesFromStaffProfileMutation,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('removing the facility.'));
        return null;
      }
    } else {
      onFailure?.call(getErrorMessage('removing the facility.'));
      reportErrorToSentry(
        hint: removeStaffFacilityErrorString,
        query: removeFacilitiesFromStaffProfileMutation,
        response: response,
        state: state,
        variables: variables,
      );
    }
    return null;
  }
}
