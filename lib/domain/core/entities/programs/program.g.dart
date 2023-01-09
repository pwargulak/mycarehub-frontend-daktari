// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Program _$$_ProgramFromJson(Map<String, dynamic> json) => _$_Program(
      id: json['id'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool? ?? false,
      organisation: json['organisation'] == null
          ? null
          : Organisation.fromJson(json['organisation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProgramToJson(_$_Program instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'organisation': instance.organisation,
    };
