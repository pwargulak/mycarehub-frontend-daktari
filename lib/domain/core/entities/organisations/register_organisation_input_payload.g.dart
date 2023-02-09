// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_organisation_input_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterOrganisationInputPayload
    _$$_RegisterOrganisationInputPayloadFromJson(Map<String, dynamic> json) =>
        _$_RegisterOrganisationInputPayload(
          registrationNumber: json['code'] as String?,
          name: json['name'] as String?,
          description: json['description'] as String?,
          country: json['defaultCountry'] as String?,
          phoneNumber: json['phoneNumber'] as String?,
          emailAddress: json['emailAddress'] as String?,
          postalAddress: json['postalAddress'] as String?,
          physicalAddress: json['physicalAddress'] as String?,
        );

Map<String, dynamic> _$$_RegisterOrganisationInputPayloadToJson(
        _$_RegisterOrganisationInputPayload instance) =>
    <String, dynamic>{
      'code': instance.registrationNumber,
      'name': instance.name,
      'description': instance.description,
      'defaultCountry': instance.country,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'postalAddress': instance.postalAddress,
      'physicalAddress': instance.physicalAddress,
    };
