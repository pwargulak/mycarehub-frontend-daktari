// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$$_MiscStateFromJson(Map<String, dynamic> json) => _$_MiscState(
      initialRoute: json['initialRoute'] as String?,
      error: json['error'] as String?,
      profileFAQsContentState: json['profileFAQsContentState'] == null
          ? null
          : FAQsContentState.fromJson(
              json['profileFAQsContentState'] as Map<String, dynamic>),
      selectedFacility: json['selectedFacility'] == null
          ? null
          : Facility.fromJson(json['selectedFacility'] as Map<String, dynamic>),
      selectedOrganisation: json['selectedOrganisation'] == null
          ? null
          : Organisation.fromJson(
              json['selectedOrganisation'] as Map<String, dynamic>),
      searchUserResponseState: json['searchUserResponseState'] == null
          ? null
          : SearchUserResponseState.fromJson(
              json['searchUserResponseState'] as Map<String, dynamic>),
      inactiveTime: json['inactiveTime'] as String?,
      resumeWithPin: json['resumeWithPin'] as bool?,
      updateFacility: json['updateFacility'] as bool?,
      searchCaregiverResponseState: json['searchCaregiverResponseState'] == null
          ? null
          : SearchCaregiverResponseState.fromJson(
              json['searchCaregiverResponseState'] as Map<String, dynamic>),
      userExists: json['userExists'] as bool?,
    );

Map<String, dynamic> _$$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'initialRoute': instance.initialRoute,
      'error': instance.error,
      'profileFAQsContentState': instance.profileFAQsContentState,
      'selectedFacility': instance.selectedFacility,
      'selectedOrganisation': instance.selectedOrganisation,
      'searchUserResponseState': instance.searchUserResponseState,
      'inactiveTime': instance.inactiveTime,
      'resumeWithPin': instance.resumeWithPin,
      'updateFacility': instance.updateFacility,
      'searchCaregiverResponseState': instance.searchCaregiverResponseState,
      'userExists': instance.userExists,
    };
