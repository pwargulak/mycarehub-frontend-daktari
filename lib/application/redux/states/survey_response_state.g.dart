// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyResponseState _$$_SurveyResponseStateFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyResponseState(
      surveyResponses: (json['listSurveyResponses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurveyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorOccurred: json['errorOccurred'] as bool?,
      timeOutOccurred: json['timeOutOccurred'] as bool?,
    );

Map<String, dynamic> _$$_SurveyResponseStateToJson(
        _$_SurveyResponseState instance) =>
    <String, dynamic>{
      'listSurveyResponses': instance.surveyResponses,
      'errorOccurred': instance.errorOccurred,
      'timeOutOccurred': instance.timeOutOccurred,
    };
