// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestCount _$$_ServiceRequestCountFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestCount(
      requestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['requestType']),
      count: json['total'] as int?,
    );

Map<String, dynamic> _$$_ServiceRequestCountToJson(
        _$_ServiceRequestCount instance) =>
    <String, dynamic>{
      'requestType': _$ServiceRequestTypeEnumMap[instance.requestType],
      'total': instance.count,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.STAFF_PIN_RESET: 'STAFF_PIN_RESET',
  ServiceRequestType.SCREENING_TOOL: 'SCREENING_TOOL',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};
