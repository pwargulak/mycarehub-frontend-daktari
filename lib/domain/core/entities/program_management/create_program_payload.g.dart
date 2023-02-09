// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_program_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateProgramPayload _$$_CreateProgramPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_CreateProgramPayload(
      name: json['name'] as String?,
      description: json['description'] as String?,
      organisationID: json['organisationID'] as String?,
    );

Map<String, dynamic> _$$_CreateProgramPayloadToJson(
        _$_CreateProgramPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'organisationID': instance.organisationID,
    };
