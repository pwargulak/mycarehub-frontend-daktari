// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchUserResponse _$$_SearchUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchUserResponse(
      id: json['id'] as String?,
      clientCCCNumber: json['cccNumber'] as String?,
      isActive: json['active'] as bool?,
      staffNumber: json['staffNumber'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      defaultFacility: json['defaultFacility'] == null
          ? null
          : Facility.fromJson(json['defaultFacility'] as Map<String, dynamic>),
      rolesList: json['rolesList'] == null
          ? null
          : RolesList.fromJson(json['rolesList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchUserResponseToJson(
        _$_SearchUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cccNumber': instance.clientCCCNumber,
      'active': instance.isActive,
      'staffNumber': instance.staffNumber,
      'user': instance.user,
      'defaultFacility': instance.defaultFacility,
      'rolesList': instance.rolesList,
    };
