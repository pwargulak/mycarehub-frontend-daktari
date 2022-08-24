// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_respondent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyRespondent _$$_SurveyRespondentFromJson(Map<String, dynamic> json) =>
    _$_SurveyRespondent(
      id: json['id'] as String?,
      name: json['name'] as String?,
      projectID: json['projectID'] as int?,
      submitterID: json['submitterID'] as int?,
      formID: json['formID'] as String?,
    );

Map<String, dynamic> _$$_SurveyRespondentToJson(_$_SurveyRespondent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projectID': instance.projectID,
      'submitterID': instance.submitterID,
      'formID': instance.formID,
    };
