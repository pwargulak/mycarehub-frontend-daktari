// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Facility _$$_FacilityFromJson(Map<String, dynamic> json) => _$_Facility(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      active: json['active'] as bool? ?? false,
      country: json['country'] as String?,
      facilityIdentifier: json['identifier'] == null
          ? null
          : FacilityIdentifier.fromJson(
              json['identifier'] as Map<String, dynamic>),
      description: json['description'] as String?,
      fhirOrganisationID: json['fhirOrganisationID'] as String?,
      workStationDetails: json['workStationDetails'] == null
          ? null
          : WorkStationDetails.fromJson(
              json['workStationDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityToJson(_$_Facility instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'active': instance.active,
      'country': instance.country,
      'identifier': instance.facilityIdentifier,
      'description': instance.description,
      'fhirOrganisationID': instance.fhirOrganisationID,
      'workStationDetails': instance.workStationDetails,
    };
