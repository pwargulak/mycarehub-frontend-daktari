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
      selectedProgram: json['selectedProgram'] == null
          ? null
          : Program.fromJson(json['selectedProgram'] as Map<String, dynamic>),
      errorGettingPrograms: json['errorGettingPrograms'] as bool?,
    );

Map<String, dynamic> _$$_ProgramsStateToJson(_$_ProgramsState instance) =>
    <String, dynamic>{
      'userPrograms': instance.userPrograms,
      'selectedProgram': instance.selectedProgram,
      'errorGettingPrograms': instance.errorGettingPrograms,
    };
