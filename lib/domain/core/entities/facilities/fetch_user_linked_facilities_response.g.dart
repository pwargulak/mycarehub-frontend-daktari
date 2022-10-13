// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_linked_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchUserLinkedFacilitiesResponse
    _$$_FetchUserLinkedFacilitiesResponseFromJson(Map<String, dynamic> json) =>
        _$_FetchUserLinkedFacilitiesResponse(
          facilitiesListResponse: json['getUserLinkedFacilities'] == null
              ? null
              : FacilitiesListResponse.fromJson(
                  json['getUserLinkedFacilities'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_FetchUserLinkedFacilitiesResponseToJson(
        _$_FetchUserLinkedFacilitiesResponse instance) =>
    <String, dynamic>{
      'getUserLinkedFacilities': instance.facilitiesListResponse,
    };
