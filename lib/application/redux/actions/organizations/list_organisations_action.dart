import 'dart:async';
import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/list_organisations_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
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

class ListOrganisationsAction extends ReduxAction<AppState> {
  ListOrganisationsAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(listOrganizationsFlag));
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
    dispatch(WaitAction<AppState>.add(listOrganizationsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'paginationInput': <String, dynamic>{
        'limit': 5,
        'currentPage': 1,
      },
    };

    final Response response =
        await client.query(listOrganizationsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchUserOrganizationsErrorString,
          query: listOrganizationsQuery,
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
      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final ListOrganisationsResponse listUserOrganisationsResponse =
          ListOrganisationsResponse.fromJson(
        data?['listOrganisations'] as Map<String, dynamic>,
      );

      final List<Organisation> organisations =
          listUserOrganisationsResponse.organisations ?? <Organisation>[];

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
