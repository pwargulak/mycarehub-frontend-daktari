// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilitiesListResponse _$$_FacilitiesListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FacilitiesListResponse(
      facilities: (json['Facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FacilitiesListResponseToJson(
        _$_FacilitiesListResponse instance) =>
    <String, dynamic>{
      'Facilities': instance.facilities,
    };
