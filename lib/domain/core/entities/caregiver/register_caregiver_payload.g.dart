// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_caregiver_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterCaregiverPayload _$$_RegisterCaregiverPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterCaregiverPayload(
      name: json['name'] as String?,
      username: json['username'] as String?,
      gender: genderFromJson(json['gender'] as String?),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      caregiverNumber: json['caregiverNumber'] as String?,
      sendInvite: json['sendInvite'] as bool?,
      assignedClients: (json['assignedClients'] as List<dynamic>?)
          ?.map((e) => AssignedClient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegisterCaregiverPayloadToJson(
        _$_RegisterCaregiverPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': dobToJson(instance.dateOfBirth),
      'phoneNumber': instance.phoneNumber,
      'caregiverNumber': instance.caregiverNumber,
      'sendInvite': instance.sendInvite,
      'assignedClients':
          instance.assignedClients?.map((e) => e.toJson()).toList(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};
