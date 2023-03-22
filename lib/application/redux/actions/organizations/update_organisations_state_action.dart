import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class UpdateOrganisationsStateAction extends ReduxAction<AppState> {
  UpdateOrganisationsStateAction({
    this.selectedOrganisation,
    this.organisations,
    this.errorGettingOrganisations,
    this.programsPayload,
  });

  final Organisation? selectedOrganisation;
  final List<Organisation>? organisations;
  final bool? errorGettingOrganisations;
  final List<Map<String, dynamic>>? programsPayload;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        organizationState:
            state.userProfileState?.organizationState?.copyWith.call(
          selectedOrganisation: selectedOrganisation ??
              state.userProfileState?.organizationState?.selectedOrganisation,
          organisations: organisations ??
              state.userProfileState?.organizationState?.organisations,
          errorGettingOrganisations: errorGettingOrganisations ??
              state.userProfileState?.organizationState
                  ?.errorGettingOrganisations,
          programsPayload: programsPayload ??
              state.userProfileState?.organizationState
                  ?.programsPayload,
        ),
      ),
    );

    return newState;
  }
}
