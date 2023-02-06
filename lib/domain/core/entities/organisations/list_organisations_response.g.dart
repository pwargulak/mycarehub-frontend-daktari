// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_organisations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListOrganisationsResponse _$$_ListOrganisationsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListOrganisationsResponse(
      organisations: (json['organisations'] as List<dynamic>?)
          ?.map((e) => Organisation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListOrganisationsResponseToJson(
        _$_ListOrganisationsResponse instance) =>
    <String, dynamic>{
      'organisations': instance.organisations,
    };
