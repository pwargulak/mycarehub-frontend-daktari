// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyResponse _$$_SurveyResponseFromJson(Map<String, dynamic> json) =>
    _$_SurveyResponse(
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      questionType:
          $enumDecodeNullable(_$QuestionTypeEnumMap, json['questionType']),
    );

Map<String, dynamic> _$$_SurveyResponseToJson(_$_SurveyResponse instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'questionType': _$QuestionTypeEnumMap[instance.questionType],
    };

const _$QuestionTypeEnumMap = {
  QuestionType.SINGLE_CHOICE: 'SINGLE_CHOICE',
  QuestionType.MULTIPLE_CHOICE: 'MULTIPLE_CHOICE',
  QuestionType.UNKNOWN: 'UNKNOWN',
};
