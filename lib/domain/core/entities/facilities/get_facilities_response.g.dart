// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFacilitiesResponse _$$_GetFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetFacilitiesResponse(
      staffLinkedFacilities: json['getStaffFacilities'] == null
          ? null
          : LinkedFacilities.fromJson(
              json['getStaffFacilities'] as Map<String, dynamic>),
      clientLinkedFacilities: json['getClientFacilities'] == null
          ? null
          : LinkedFacilities.fromJson(
              json['getClientFacilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetFacilitiesResponseToJson(
        _$_GetFacilitiesResponse instance) =>
    <String, dynamic>{
      'getStaffFacilities': instance.staffLinkedFacilities,
      'getClientFacilities': instance.clientLinkedFacilities,
    };
