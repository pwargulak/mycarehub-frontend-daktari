import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';

class OrganisationsStateViewModel extends Vm {
  OrganisationsStateViewModel({
    required this.wait,
    this.organisations,
    this.selectedOrganisation,
    this.errorGettingOrganisations,
  }) : super(
          equals: <Object?>[
            wait,
            organisations,
            selectedOrganisation,
            errorGettingOrganisations
          ],
        );

  factory OrganisationsStateViewModel.fromStore(Store<AppState> store) {
    return OrganisationsStateViewModel(
      wait: store.state.wait!,
      organisations:
          store.state.userProfileState?.organizationState?.organisations,
      selectedOrganisation:
          store.state.userProfileState?.organizationState?.selectedOrganisation,
      errorGettingOrganisations: store
          .state.userProfileState?.organizationState?.errorGettingOrganisations,
    );
  }

  final bool? errorGettingOrganisations;
  final List<Organisation>? organisations;
  final Organisation? selectedOrganisation;
  final Wait wait;
}
