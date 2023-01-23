// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_facilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkedFacilities _$$_LinkedFacilitiesFromJson(Map<String, dynamic> json) =>
    _$_LinkedFacilities(
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LinkedFacilitiesToJson(_$_LinkedFacilities instance) =>
    <String, dynamic>{
      'facilities': instance.facilities,
    };
