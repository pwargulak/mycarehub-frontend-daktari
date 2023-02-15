import 'dart:async';

import 'package:prohealth360_daktari/application/redux/actions/organizations/list_organisations_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/register_organisation_input_payload.dart';
import 'package:prohealth360_daktari/domain/core/entities/program_management/create_program_payload.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class CreateOrganizationAction extends ReduxAction<AppState> {
  final RegisterOrganisationInputPayload registerOrganisationInputPayload;
  final IGraphQlClient client;
  final VoidCallback onSuccess;

  CreateOrganizationAction({
    required this.registerOrganisationInputPayload,
    required this.client,
    required this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(registerOrganisationFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(registerOrganisationFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> payload =
        registerOrganisationInputPayload.toJson();

    final List<dynamic> programInputs = <dynamic>[];

    final List<Program> selectedPrograms =
        state.userProfileState?.programsState?.selectedPrograms ?? <Program>[];

    if (selectedPrograms.isNotEmpty) {
      for (final Program program in selectedPrograms) {
        programInputs.add(
          CreateProgramPayload(
            name: program.name,
            description: program.description,
            organisationID: program.organisation?.id,
          ).toJson(),
        );
      }
    }
    
    final Response response = await client.query(
      createOrganisationMutation,
      <String, dynamic>{
        'organisationInput': payload,
        'programInput': programInputs
      },
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains(phoneExists)) {
          throw const UserException(userWithPhoneExists);
        }

        if (errors.contains(cccExists)) {
          throw const UserException(staffCccExists);
        }

        reportErrorToSentry(
          hint: createOrganisationErrorString,
          query: createOrganisationMutation,
          response: response,
          state: state,
          variables: payload,
          exception: errors,
        );

        throw const UserException(somethingWentWrongText);
      }

      this.onSuccess();
      dispatch(
        ListOrganisationsAction(
          client: client,
        ),
      );
      await AnalyticsService().logEvent(
        name: registerStaff,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'code': registerOrganisationInputPayload.registrationNumber,
          'name': registerOrganisationInputPayload.name,
        },
      );
    } else {
      reportErrorToSentry(
        hint: createOrganisationErrorString,
        query: createOrganisationMutation,
        response: response,
        state: state,
        variables: payload,
      );
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
