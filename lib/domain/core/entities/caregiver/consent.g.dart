// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Consent _$$_ConsentFromJson(Map<String, dynamic> json) => _$_Consent(
      consentStatus:
          $enumDecodeNullable(_$ConsentStatusEnumMap, json['consentStatus']),
    );

Map<String, dynamic> _$$_ConsentToJson(_$_Consent instance) =>
    <String, dynamic>{
      'consentStatus': _$ConsentStatusEnumMap[instance.consentStatus],
    };

const _$ConsentStatusEnumMap = {
  ConsentStatus.ACCEPTED: 'ACCEPTED',
  ConsentStatus.REJECTED: 'REJECTED',
  ConsentStatus.PENDING: 'PENDING',
  ConsentStatus.UNKNOWN: 'UNKNOWN',
};
