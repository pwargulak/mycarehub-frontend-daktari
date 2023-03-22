import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';

part 'organisation_state.freezed.dart';
part 'organisation_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OrganisationState with _$OrganisationState {
  factory OrganisationState({
    List<Organisation>? organisations,
    Organisation? selectedOrganisation,
    bool? errorGettingOrganisations,

    //Used when creating an organisation
    List<Map<String, dynamic>>? programsPayload,
  }) = _OrganisationState;

  factory OrganisationState.fromJson(Map<String, dynamic> json) =>
      _$OrganisationStateFromJson(json);

  factory OrganisationState.initial() => OrganisationState(
        organisations: <Organisation>[],
        selectedOrganisation: Organisation.initial(),
        errorGettingOrganisations: false,
        programsPayload: <Map<String, dynamic>>[],
      );
}
