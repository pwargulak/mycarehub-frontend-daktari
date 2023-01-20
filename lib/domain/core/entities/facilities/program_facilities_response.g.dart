// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramFacilitiesResponse _$$_ProgramFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProgramFacilitiesResponse(
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProgramFacilitiesResponseToJson(
        _$_ProgramFacilitiesResponse instance) =>
    <String, dynamic>{
      'facilities': instance.facilities,
    };
