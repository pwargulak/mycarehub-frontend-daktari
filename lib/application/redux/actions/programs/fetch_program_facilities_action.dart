import 'dart:async';
import 'package:prohealth360_daktari/domain/core/entities/programs/list_program_facilities_response.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchProgramFacilitiesAction extends ReduxAction<AppState> {
  FetchProgramFacilitiesAction({
    required this.client,
    this.onFailure,
    required this.programId,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String programId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(retrieveFacilityFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(UpdateUserProfileAction(linkedFacilities: <Facility>[]));
    dispatch(WaitAction<AppState>.add(retrieveFacilityFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'programID': programId,
    };

    final Response response =
        await client.query(getProgramFacilitiesQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: errorFetchingFacilitiesString,
          query: getProgramFacilitiesQuery,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('facilities linked to this program'));
        return null;
      }

      final ListProgramFacilitiesResponse getFacilitiesResponse =
          ListProgramFacilitiesResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );
      final List<Facility> linkedFacilities =
          getFacilitiesResponse.programFacilities ??
              <Facility>[];

      dispatch(
        UpdateUserProfileAction(
          linkedFacilities: linkedFacilities,
        ),
      );
    } else {
      onFailure?.call(getErrorMessage('facilities linked to this program'));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: getProgramFacilitiesQuery,
        ),
      );
    }
    return null;
  }
}
