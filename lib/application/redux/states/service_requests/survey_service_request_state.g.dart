// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_service_request_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyServiceRequestState _$$_SurveyServiceRequestStateFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyServiceRequestState(
      surveys: (json['getSurveyWithServiceRequest'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurveyServiceRequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      surveyServiceRequestRespondentsState:
          json['getSurveyServiceRequestUser'] == null
              ? null
              : SurveyServiceRequestRespondentsState.fromJson(
                  json['getSurveyServiceRequestUser'] as Map<String, dynamic>),
      surveyResponses: (json['getSurveyResponse'] as List<dynamic>?)
          ?.map((e) => SurveyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingSurveys: json['errorFetchingSurveys'] as bool?,
    );

Map<String, dynamic> _$$_SurveyServiceRequestStateToJson(
        _$_SurveyServiceRequestState instance) =>
    <String, dynamic>{
      'getSurveyWithServiceRequest': instance.surveys,
      'getSurveyServiceRequestUser':
          instance.surveyServiceRequestRespondentsState,
      'getSurveyResponse': instance.surveyResponses,
      'errorFetchingSurveys': instance.errorFetchingSurveys,
    };
