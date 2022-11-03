// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_caregivers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientCaregiversResponse _$$_ClientCaregiversResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ClientCaregiversResponse(
      caregiversList: json['listClientsCaregivers'] == null
          ? null
          : CaregiversList.fromJson(
              json['listClientsCaregivers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientCaregiversResponseToJson(
        _$_ClientCaregiversResponse instance) =>
    <String, dynamic>{
      'listClientsCaregivers': instance.caregiversList,
    };
