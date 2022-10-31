// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Caregiver _$$_CaregiverFromJson(Map<String, dynamic> json) => _$_Caregiver(
      id: json['id'] as String?,
      caregiverUser: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      caregiverNumber: json['caregiverNumber'] as String?,
      isClient: json['isClient'] as bool?,
    );

Map<String, dynamic> _$$_CaregiverToJson(_$_Caregiver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.caregiverUser,
      'caregiverNumber': instance.caregiverNumber,
      'isClient': instance.isClient,
    };
