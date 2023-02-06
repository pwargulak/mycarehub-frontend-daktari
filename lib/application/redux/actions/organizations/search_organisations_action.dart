import 'dart:async';
import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/search_organisations_response.dart';
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

class SearchOrganisationsAction extends ReduxAction<AppState> {
  SearchOrganisationsAction({required this.client, required this.query});

  final IGraphQlClient client;
  final String query;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchOrganizationsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateOrganisationsStateAction(
        organisations: <Organisation>[],
        errorGettingOrganisations: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(searchOrganizationsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': query
    };

    final Response response =
        await client.query(searchOrganizationQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: searchOrganizationsErrorString,
          query: searchOrganizationQuery,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        dispatch(
          UpdateOrganisationsStateAction(errorGettingOrganisations: true),
        );
        return null;
      }
      final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;

      final SearchOrganisationsResponse searchOrganisationsResponse =
          SearchOrganisationsResponse.fromJson(data);

      final List<Organisation> organisations =
          searchOrganisationsResponse.organisations ?? <Organisation>[];

      dispatch(
        UpdateOrganisationsStateAction(
          organisations: organisations,
        ),
      );
    } else {
      dispatch(UpdateOrganisationsStateAction(errorGettingOrganisations: true));
      Sentry.captureException(
        UserException(
          processedResponse.message,
          cause: listOrganizationsQuery,
        ),
      );
    }
    return state;
  }
}
