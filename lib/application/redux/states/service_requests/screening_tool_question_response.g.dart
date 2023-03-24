// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tool_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolQuestionResponses _$$_ScreeningToolQuestionResponsesFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolQuestionResponses(
      id: json['id'] as String?,
      screeningToolId: json['screeningToolID'] as String?,
      facilityId: json['facilityID'] as String?,
      clientId: json['clientID'] as String?,
      questionResponses: (json['questionResponses'] as List<dynamic>?)
          ?.map((e) => QuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningToolQuestionResponsesToJson(
        _$_ScreeningToolQuestionResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'screeningToolID': instance.screeningToolId,
      'facilityID': instance.facilityId,
      'clientID': instance.clientId,
      'questionResponses': instance.questionResponses,
    };
