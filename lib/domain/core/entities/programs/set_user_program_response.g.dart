// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_program_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetUserProgramResponse _$$_SetUserProgramResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SetUserProgramResponse(
      staffProfile: json['staffProfile'] == null
          ? null
          : StaffProfileResponse.fromJson(
              json['staffProfile'] as Map<String, dynamic>),
      communityToken: json['communityToken'] as String?,
    );

Map<String, dynamic> _$$_SetUserProgramResponseToJson(
        _$_SetUserProgramResponse instance) =>
    <String, dynamic>{
      'staffProfile': instance.staffProfile,
      'communityToken': instance.communityToken,
    };
