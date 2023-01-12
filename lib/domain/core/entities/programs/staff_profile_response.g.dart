// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffProfileResponse _$$_StaffProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StaffProfileResponse(
      id: json['ID'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      staffNumber: json['StaffNumber'] as String?,
      defaultFacility: json['DefaultFacility'] == null
          ? null
          : Facility.fromJson(json['DefaultFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StaffProfileResponseToJson(
        _$_StaffProfileResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'User': instance.user,
      'StaffNumber': instance.staffNumber,
      'DefaultFacility': instance.defaultFacility,
    };
