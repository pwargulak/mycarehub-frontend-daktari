// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_service_request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyServiceRequestItem _$$_SurveyServiceRequestItemFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyServiceRequestItem(
      projectId: json['projectID'] as int?,
      xmlFormId: json['formID'] as String?,
      name: json['title'] as String?,
    );

Map<String, dynamic> _$$_SurveyServiceRequestItemToJson(
        _$_SurveyServiceRequestItem instance) =>
    <String, dynamic>{
      'projectID': instance.projectId,
      'formID': instance.xmlFormId,
      'title': instance.name,
    };
