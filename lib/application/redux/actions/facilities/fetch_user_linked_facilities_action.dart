import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/fetch_user_linked_facilities_response.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchUserLinkedFacilitiesAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final String userID;

  FetchUserLinkedFacilitiesAction({
    required this.client,
    this.onFailure,
    required this.userID,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateStaffProfileAction(facilities: <Facility>[]));
    dispatch(WaitAction<AppState>.add(fetchFacilitiesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFacilitiesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'paginationInput': <String, dynamic>{
        'Limit': 10,
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
        Sentry.captureException(
          UserException(errors),
        );
      }

      final FetchUserLinkedFacilitiesResponse
          fetchUserLinkedFacilitiesResponse =
          FetchUserLinkedFacilitiesResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(
        UpdateStaffProfileAction(
          facilities: fetchUserLinkedFacilitiesResponse
                  .facilitiesListResponse?.facilities ??
              <Facility>[],
        ),
      );
    } else {}
    return null;
  }
}
