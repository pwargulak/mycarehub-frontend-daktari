// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilitiesState _$$_FacilitiesStateFromJson(Map<String, dynamic> json) =>
    _$_FacilitiesState(
      programFacilities: (json['programFacilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedFacility: json['selectedFacility'] == null
          ? null
          : Facility.fromJson(json['selectedFacility'] as Map<String, dynamic>),
      errorGettingFacilities: json['errorGettingFacilities'] as bool?,
    );

Map<String, dynamic> _$$_FacilitiesStateToJson(_$_FacilitiesState instance) =>
    <String, dynamic>{
      'programFacilities': instance.programFacilities,
      'selectedFacility': instance.selectedFacility,
      'errorGettingFacilities': instance.errorGettingFacilities,
    };
