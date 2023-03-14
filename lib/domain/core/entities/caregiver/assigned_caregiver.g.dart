// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_caregiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignedCaregiver _$$_AssignedCaregiverFromJson(Map<String, dynamic> json) =>
    _$_AssignedCaregiver(
      clientID: json['clientID'] as String?,
      caregiverID: json['caregiverID'] as String?,
      caregiverType:
          $enumDecodeNullable(_$CaregiverTypeEnumMap, json['caregiverType']),
    );

Map<String, dynamic> _$$_AssignedCaregiverToJson(
        _$_AssignedCaregiver instance) =>
    <String, dynamic>{
      'clientID': instance.clientID,
      'caregiverID': instance.caregiverID,
      'caregiverType': _$CaregiverTypeEnumMap[instance.caregiverType],
    };

const _$CaregiverTypeEnumMap = {
  CaregiverType.FATHER: 'FATHER',
  CaregiverType.MOTHER: 'MOTHER',
  CaregiverType.SIBLING: 'SIBLING',
  CaregiverType.HEALTH_PROFESSIONAL: 'HEALTH_PROFESSIONAL',
};
