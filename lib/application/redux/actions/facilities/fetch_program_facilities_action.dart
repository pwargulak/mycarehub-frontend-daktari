import 'dart:async';
import 'package:prohealth360_daktari/application/redux/actions/facilities/update_facilities_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/program_facilities_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchProgramFacilitiesAction extends ReduxAction<AppState> {
  FetchProgramFacilitiesAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchProgramFacilitiesFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateFacilitiesStateAction(
        programFacilities: <Facility>[],
        errorGettingFacilities: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchProgramFacilitiesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String programId =
        state.userProfileState?.programsState?.selectedProgram?.id ?? '';
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
          hint: fetchUserProgramsErrorString,
          query: listUserProgramsQuery,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        dispatch(UpdateFacilitiesStateAction(errorGettingFacilities: true));
        return null;
      }

      final ProgramFacilitiesResponse programFacilitiesResponse =
          ProgramFacilitiesResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(
        UpdateFacilitiesStateAction(
          programFacilities: programFacilitiesResponse.facilities,
        ),
      );
    } else {
      dispatch(UpdateFacilitiesStateAction(errorGettingFacilities: true));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: listUserProgramsQuery,
        ),
      );
    }
    return state;
  }
}
