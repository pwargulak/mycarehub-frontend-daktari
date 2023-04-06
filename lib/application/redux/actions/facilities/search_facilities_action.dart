import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/register_client/fetch_facilities_response.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class SearchFacilitiesAction extends ReduxAction<AppState> {
  SearchFacilitiesAction({
    required this.client,
    this.onFailure,
    required this.mflCode,
    required this.searchFromProgram,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final String mflCode;
  final bool searchFromProgram;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchFacilitiesFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(UpdateUserProfileAction(facilities: <Facility>[]));
    dispatch(WaitAction<AppState>.add(fetchFacilitiesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call('connection failure');
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': mflCode,
      'paginationInput': <String, dynamic>{
        'limit': 20,
        'currentPage': 1,
      },
    };

    final Response response = await client.query(
      searchFromProgram ? searchProgramFacilitiesQuery : searchFacilityQuery,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchFacilitiesErrorString,
          query: searchFacilityQuery,
          response: response,
          state: state,
          variables: variables,
          exception: errors,
        );

        throw UserException(getErrorMessage('fetching facilities'));
      }
      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;
      final Map<String, dynamic>? programData = searchFromProgram
          ? (data?['listProgramFacilities'] as Map<String, dynamic>?)
          : data?['listFacilities'] as Map<String, dynamic>?;

      if (programData?.isNotEmpty ?? false) {
        final FetchFacilitiesResponse facilities =
            FetchFacilitiesResponse.fromJson(programData!);

        dispatch(UpdateUserProfileAction(facilities: facilities.facilities));
      }
    } else {
      throw UserException(processedResponse.message);
    }
    return null;
  }
}
