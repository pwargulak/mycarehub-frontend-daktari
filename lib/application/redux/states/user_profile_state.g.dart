// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileState _$$_UserProfileStateFromJson(Map<String, dynamic> json) =>
    _$_UserProfileState(
      userProfile: json['userProfile'] == null
          ? null
          : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      programsState: json['programsState'] == null
          ? null
          : ProgramsState.fromJson(
              json['programsState'] as Map<String, dynamic>),
      facilitiesState: json['facilitiesState'] == null
          ? null
          : FacilitiesState.fromJson(
              json['facilitiesState'] as Map<String, dynamic>),
      organizationState: json['organizationState'] == null
          ? null
          : OrganisationState.fromJson(
              json['organizationState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileStateToJson(_$_UserProfileState instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'programsState': instance.programsState,
      'facilitiesState': instance.facilitiesState,
      'organizationState': instance.organizationState,
    };
