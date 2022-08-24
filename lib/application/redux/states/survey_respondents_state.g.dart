// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_respondents_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyRespondentsState _$$_SurveyRespondentsStateFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyRespondentsState(
      surveyRespondents: (json['surveyRespondents'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurveyRespondent.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorOccurred: json['errorOccurred'] as bool?,
    );

Map<String, dynamic> _$$_SurveyRespondentsStateToJson(
        _$_SurveyRespondentsState instance) =>
    <String, dynamic>{
      'surveyRespondents': instance.surveyRespondents,
      'errorOccurred': instance.errorOccurred,
    };
