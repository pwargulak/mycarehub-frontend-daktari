// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';

part 'caregivers_list.freezed.dart';
part 'caregivers_list.g.dart';

@freezed
class CaregiversList with _$CaregiversList {
  factory CaregiversList({
    @JsonKey(name: 'caregivers') List<Caregiver?>? caregivers,
  }) = _CaregiversList;

  factory CaregiversList.fromJson(Map<String, dynamic> json) =>
      _$CaregiversListFromJson(json);
}
