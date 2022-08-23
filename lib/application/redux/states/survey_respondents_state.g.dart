// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_respondents_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyRespondentsState _$$_SurveyRespondentsStateFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyRespondentsState(
      surveyRespondents: (json['listSurveyResponses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurveyRespondent.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorOccurred: json['errorOccurred'] as bool?,
      timeOutOccurred: json['timeOutOccurred'] as bool?,
    );

Map<String, dynamic> _$$_SurveyRespondentsStateToJson(
        _$_SurveyRespondentsState instance) =>
    <String, dynamic>{
      'listSurveyResponses': instance.surveyRespondents,
      'errorOccurred': instance.errorOccurred,
      'timeOutOccurred': instance.timeOutOccurred,
    };
