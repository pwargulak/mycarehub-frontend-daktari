// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrganisationState _$$_OrganisationStateFromJson(Map<String, dynamic> json) =>
    _$_OrganisationState(
      organisations: (json['organisations'] as List<dynamic>?)
          ?.map((e) => Organisation.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedOrganisation: json['selectedOrganisation'] == null
          ? null
          : Organisation.fromJson(
              json['selectedOrganisation'] as Map<String, dynamic>),
      errorGettingOrganisations: json['errorGettingOrganisations'] as bool?,
      programsPayload: (json['programsPayload'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_OrganisationStateToJson(
        _$_OrganisationState instance) =>
    <String, dynamic>{
      'organisations': instance.organisations,
      'selectedOrganisation': instance.selectedOrganisation,
      'errorGettingOrganisations': instance.errorGettingOrganisations,
      'programsPayload': instance.programsPayload,
    };
