// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tool_respondent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolRespondent _$$_ScreeningToolRespondentFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolRespondent(
      clientID: json['clientID'] as String?,
      screeningToolResponseID: json['screeningToolResponseID'] as String?,
      serviceRequestID: json['serviceRequestID'] as String?,
      name: json['name'] as String?,
      serviceRequest: json['serviceRequest'] as String?,
    );

Map<String, dynamic> _$$_ScreeningToolRespondentToJson(
        _$_ScreeningToolRespondent instance) =>
    <String, dynamic>{
      'clientID': instance.clientID,
      'screeningToolResponseID': instance.screeningToolResponseID,
      'serviceRequestID': instance.serviceRequestID,
      'name': instance.name,
      'serviceRequest': instance.serviceRequest,
    };
