// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionResponse _$$_QuestionResponseFromJson(Map<String, dynamic> json) =>
    _$_QuestionResponse(
      questionType:
          $enumDecodeNullable(_$QuestionTypeEnumMap, json['questionType']),
      selectMultiple: json['selectMultiple'] as bool?,
      responseValueType: json['responseValueType'] as String?,
      sequence: json['sequence'] as int?,
      questionText: json['questionText'] as String?,
      normalizedResponse: json['normalizedResponse'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_QuestionResponseToJson(_$_QuestionResponse instance) =>
    <String, dynamic>{
      'questionType': _$QuestionTypeEnumMap[instance.questionType],
      'selectMultiple': instance.selectMultiple,
      'responseValueType': instance.responseValueType,
      'sequence': instance.sequence,
      'questionText': instance.questionText,
      'normalizedResponse': instance.normalizedResponse,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.OPEN_ENDED: 'OPEN_ENDED',
  QuestionType.CLOSE_ENDED: 'CLOSE_ENDED',
};
