import 'dart:convert';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

/// [RetrieveFacilityAction] is a Redux Action whose job is to retrieve a staff's
/// default facility's details.
class RetrieveFacilityAction extends ReduxAction<AppState> {
  RetrieveFacilityAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(retrieveFacilityFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(retrieveFacilityFlag));
  }

  @override
  Future<AppState> reduce() async {
    final String? facilityID =
        state.userProfileState?.userProfile?.defaultFacility?.id;
    final String? facilityName =
        state.userProfileState?.userProfile?.defaultFacilityName;

    final Map<String, dynamic> variables = <String, dynamic>{
      'id': facilityID,
      'active': true,
    };

    final http.Response result = await client.query(
      retrieveFacilityQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(result);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;
      final String? errors = client.parseError(responseMap);

      if (errors != null) {
        reportErrorToSentry(
          hint: updateFacilityInfoErrorString,
          query: retrieveFacilityQuery,
          response: result,
          state: state,
          variables: variables,
        );

        throw UserException(
          getErrorMessage('getting updated facility information'),
        );
      }
      final Map<String, dynamic>? data =
          responseMap['data'] as Map<String, dynamic>?;
      final Facility facility = Facility.fromJson(
        data?['retrieveFacility'] as Map<String, dynamic>,
      );

      if (facility.name == facilityName) {
        final List<Facility> facilities =
            state.userProfileState?.userProfile?.facilities ?? <Facility>[];

        final List<Facility> removed = facilities
            .where((Facility element) => element.name != facilityName)
            .toList();
        dispatch(
          UpdateUserProfileAction(
            facilities: <Facility>[facility, ...removed],
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return state;
  }
}
