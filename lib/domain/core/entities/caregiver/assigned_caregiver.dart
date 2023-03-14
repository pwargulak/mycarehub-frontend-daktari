import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

part 'assigned_caregiver.freezed.dart';
part 'assigned_caregiver.g.dart';

@freezed
class AssignedCaregiver with _$AssignedCaregiver {
  factory AssignedCaregiver({
    @JsonKey(name: 'clientID') String? clientID,
    @JsonKey(name: 'caregiverID') String? caregiverID,
    @JsonKey(name: 'caregiverType') CaregiverType? caregiverType,
  }) = _AssignedCaregiver;

  factory AssignedCaregiver.fromJson(Map<String, dynamic> json) =>
      _$AssignedCaregiverFromJson(json);
}
