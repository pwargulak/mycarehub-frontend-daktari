// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregivers_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CaregiversList _$$_CaregiversListFromJson(Map<String, dynamic> json) =>
    _$_CaregiversList(
      caregivers: (json['caregivers'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Caregiver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CaregiversListToJson(_$_CaregiversList instance) =>
    <String, dynamic>{
      'caregivers': instance.caregivers,
    };
