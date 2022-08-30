// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_service_request_respondents_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyServiceRequestRespondentsState
    _$$_SurveyServiceRequestRespondentsStateFromJson(
            Map<String, dynamic> json) =>
        _$_SurveyServiceRequestRespondentsState(
          surveyRespondents: (json['users'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SurveyRespondent.fromJson(e as Map<String, dynamic>))
              .toList(),
          errorFetchingSurveys: json['errorFetchingSurveys'] as bool?,
        );

Map<String, dynamic> _$$_SurveyServiceRequestRespondentsStateToJson(
        _$_SurveyServiceRequestRespondentsState instance) =>
    <String, dynamic>{
      'users': instance.surveyRespondents,
      'errorFetchingSurveys': instance.errorFetchingSurveys,
    };
