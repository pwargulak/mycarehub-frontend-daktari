// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_State _$$_StateFromJson(Map<String, dynamic> json) => _$_State(
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      homeState: json['homeState'] == null
          ? null
          : HomeState.fromJson(json['homeState'] as Map<String, dynamic>),
      onboardingState: json['onboardingState'] == null
          ? null
          : OnboardingState.fromJson(
              json['onboardingState'] as Map<String, dynamic>),
      bottomNavigationState: json['bottomNavigationState'] == null
          ? null
          : BottomNavigationState.fromJson(
              json['bottomNavigationState'] as Map<String, dynamic>),
      miscState: json['miscState'] == null
          ? null
          : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
      userProfileState: json['userProfileState'] == null
          ? null
          : UserProfileState.fromJson(
              json['userProfileState'] as Map<String, dynamic>),
      surveyState: json['surveyState'] == null
          ? null
          : SurveyState.fromJson(json['surveyState'] as Map<String, dynamic>),
      serviceRequestState: json['serviceRequestState'] == null
          ? null
          : ServiceRequestState.fromJson(
              json['serviceRequestState'] as Map<String, dynamic>),
      connectivityState: json['connectivityState'] == null
          ? null
          : ConnectivityState.fromJson(
              json['connectivityState'] as Map<String, dynamic>),
      chatState: json['chatState'] == null
          ? null
          : ChatState.fromJson(json['chatState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StateToJson(_$_State instance) => <String, dynamic>{
      'credentials': instance.credentials,
      'homeState': instance.homeState,
      'onboardingState': instance.onboardingState,
      'bottomNavigationState': instance.bottomNavigationState,
      'miscState': instance.miscState,
      'userProfileState': instance.userProfileState,
      'surveyState': instance.surveyState,
      'serviceRequestState': instance.serviceRequestState,
      'connectivityState': instance.connectivityState,
      'chatState': instance.chatState,
    };
