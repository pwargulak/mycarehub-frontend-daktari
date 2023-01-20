// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffProfileResponse _$$_StaffProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StaffProfileResponse(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      staffNumber: json['staffNumber'] as String?,
      defaultFacility: json['defaultFacility'] == null
          ? null
          : Facility.fromJson(json['defaultFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StaffProfileResponseToJson(
        _$_StaffProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'staffNumber': instance.staffNumber,
      'defaultFacility': instance.defaultFacility,
    };
