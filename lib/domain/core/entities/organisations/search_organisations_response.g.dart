// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_organisations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchOrganisationsResponse _$$_SearchOrganisationsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchOrganisationsResponse(
      organisations: (json['searchOrganisations'] as List<dynamic>?)
          ?.map((e) => Organisation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchOrganisationsResponseToJson(
        _$_SearchOrganisationsResponse instance) =>
    <String, dynamic>{
      'searchOrganisations': instance.organisations,
    };
