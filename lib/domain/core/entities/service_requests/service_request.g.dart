// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequest _$$_ServiceRequestFromJson(Map<String, dynamic> json) =>
    _$_ServiceRequest(
      id: json['id'] as String?,
      description: json['request'] as String?,
      serviceRequestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['requestType']),
      clientId: json['clientID'] as String?,
      clientName: json['clientName'] as String?,
      clientPhoneNumber: json['clientContact'] as String?,
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']),
      resolvedTime: json['resolvedAt'] as String?,
      resolvedBy: json['resolvedBy'] as String?,
      resolvedByName: json['resolvedByName'] as String?,
      createdAt: json['createdAt'] as String?,
      meta: json['meta'] == null
          ? null
          : ServiceRequestMeta.fromJson(json['meta'] as Map<String, dynamic>),
      staffId: json['staffID'] as String?,
      staffName: json['staffName'] as String?,
      staffPhoneNumber: json['staffContact'] as String?,
    );

Map<String, dynamic> _$$_ServiceRequestToJson(_$_ServiceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.description,
      'requestType': _$ServiceRequestTypeEnumMap[instance.serviceRequestType],
      'clientID': instance.clientId,
      'clientName': instance.clientName,
      'clientContact': instance.clientPhoneNumber,
      'status': _$RequestStatusEnumMap[instance.status],
      'resolvedAt': instance.resolvedTime,
      'resolvedBy': instance.resolvedBy,
      'resolvedByName': instance.resolvedByName,
      'createdAt': instance.createdAt,
      'meta': instance.meta,
      'staffID': instance.staffId,
      'staffName': instance.staffName,
      'staffContact': instance.staffPhoneNumber,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.STAFF_PIN_RESET: 'STAFF_PIN_RESET',
  ServiceRequestType.SCREENING_TOOLS_RED_FLAG: 'SCREENING_TOOLS_RED_FLAG',
  ServiceRequestType.HOME_PAGE_HEALTH_DIARY_ENTRY:
      'HOME_PAGE_HEALTH_DIARY_ENTRY',
  ServiceRequestType.SURVEY_RED_FLAG: 'SURVEY_RED_FLAG',
  ServiceRequestType.APPOINTMENTS: 'APPOINTMENTS',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};

const _$RequestStatusEnumMap = {
  RequestStatus.PENDING: 'PENDING',
  RequestStatus.RESOLVED: 'RESOLVED',
  RequestStatus.IN_PROGRESS: 'IN_PROGRESS',
  RequestStatus.UNKNOWN: 'UNKNOWN',
};
