// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_program_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListProgramFacilitiesResponse _$$_ListProgramFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListProgramFacilitiesResponse(
      programFacilities: (json['getProgramFacilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListProgramFacilitiesResponseToJson(
        _$_ListProgramFacilitiesResponse instance) =>
    <String, dynamic>{
      'getProgramFacilities': instance.programFacilities,
    };
