import 'dart:async';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/get_facilities_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchUserLinkedFacilitiesAction extends ReduxAction<AppState> {
  FetchUserLinkedFacilitiesAction({
    required this.client,
    this.onFailure,
    required this.userId,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String userId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(retrieveFacilityFlag));
    super.after();
  }

  @override
  void before() {
    super.before();

    dispatch(UpdateStaffProfileAction(linkedFacilities: <Facility>[]));
    dispatch(WaitAction<AppState>.add(retrieveFacilityFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userId,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': 1,
      }
    };

    final Response response =
        await client.query(getUserLinkedFacilitiesQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: errorFetchingFacilitiesString,
          query: getUserLinkedFacilitiesQuery,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('facilities linked to this user'));
        return null;
      }

      final GetFacilitiesResponse getFacilitiesResponse =
          GetFacilitiesResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(
        UpdateStaffProfileAction(
          linkedFacilities:
              getFacilitiesResponse.linkedFacilities?.facilities ??
                  <Facility>[],
        ),
      );
    } else {
      onFailure?.call(getErrorMessage('facilities linked to this user'));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: getUserLinkedFacilitiesQuery,
        ),
      );
    }
    return null;
  }
}
