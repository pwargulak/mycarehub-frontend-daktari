import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
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
      'userID': state.staffState?.user?.userId
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
      if ((body['data'] as Map<String, dynamic>)['setStaffDefaultFacility'] ==
          true) {
        dispatch(
          UpdateStaffProfileAction(
            defaultFacility: facilityId,
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
