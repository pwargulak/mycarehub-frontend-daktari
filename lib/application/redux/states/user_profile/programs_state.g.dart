// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programs_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramsState _$$_ProgramsStateFromJson(Map<String, dynamic> json) =>
    _$_ProgramsState(
      userPrograms: (json['userPrograms'] as List<dynamic>?)
          ?.map((e) => Program.fromJson(e as Map<String, dynamic>))
          .toList(),
      programs: (json['programs'] as List<dynamic>?)
          ?.map((e) => Program.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedPrograms: (json['selectedPrograms'] as List<dynamic>?)
          ?.map((e) => Program.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedUserProgram: json['selectedUserProgram'] == null
          ? null
          : Program.fromJson(
              json['selectedUserProgram'] as Map<String, dynamic>),
      errorGettingPrograms: json['errorGettingPrograms'] as bool?,
    );

Map<String, dynamic> _$$_ProgramsStateToJson(_$_ProgramsState instance) =>
    <String, dynamic>{
      'userPrograms': instance.userPrograms,
      'programs': instance.programs,
      'selectedPrograms': instance.selectedPrograms,
      'selectedUserProgram': instance.selectedUserProgram,
      'errorGettingPrograms': instance.errorGettingPrograms,
    };
