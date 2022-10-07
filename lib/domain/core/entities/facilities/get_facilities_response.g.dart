// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFacilitiesResponse _$$_GetFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetFacilitiesResponse(
      linkedFacilities: json['getUserLinkedFacilities'] == null
          ? null
          : LinkedFacilities.fromJson(
              json['getUserLinkedFacilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetFacilitiesResponseToJson(
        _$_GetFacilitiesResponse instance) =>
    <String, dynamic>{
      'getUserLinkedFacilities': instance.linkedFacilities,
    };
