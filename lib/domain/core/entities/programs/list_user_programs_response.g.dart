// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_programs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListUserProgramsResponse _$$_ListUserProgramsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListUserProgramsResponse(
      count: json['count'] as int?,
      programs: (json['programs'] as List<dynamic>?)
          ?.map((e) => Program.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListUserProgramsResponseToJson(
        _$_ListUserProgramsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'programs': instance.programs,
    };
