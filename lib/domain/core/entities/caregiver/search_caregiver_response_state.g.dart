// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_caregiver_response_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCaregiverResponseState _$$_SearchCaregiverResponseStateFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCaregiverResponseState(
      caregivers: (json['searchCaregiverUser'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Caregiver.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingCaregivers: json['errorFetchingCaregivers'] as bool?,
      noCaregiversFound: json['noCaregiversFound'] as bool?,
    );

Map<String, dynamic> _$$_SearchCaregiverResponseStateToJson(
        _$_SearchCaregiverResponseState instance) =>
    <String, dynamic>{
      'searchCaregiverUser': instance.caregivers,
      'errorFetchingCaregivers': instance.errorFetchingCaregivers,
      'noCaregiversFound': instance.noCaregiversFound,
    };
