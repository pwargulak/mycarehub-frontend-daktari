// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'caregiver.freezed.dart';
part 'caregiver.g.dart';

@freezed
class Caregiver with _$Caregiver {
  factory Caregiver({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user') UserData? caregiverUser,
    @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
    @JsonKey(name: 'isClient') bool? isClient,
    @JsonKey(name: 'consented') bool? isConsented,
  }) = _Caregiver;

  factory Caregiver.fromJson(Map<String, dynamic> json) =>
      _$CaregiverFromJson(json);

  factory Caregiver.initial() => Caregiver(
        id: UNKNOWN,
        caregiverUser: UserData.initial(),
        caregiverNumber: UNKNOWN,
        isClient: false,
        isConsented: false,
      );
}
