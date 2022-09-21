import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';

part 'register_caregiver_payload.freezed.dart';
part 'register_caregiver_payload.g.dart';

@freezed
class RegisterCaregiverPayload with _$RegisterCaregiverPayload {
  factory RegisterCaregiverPayload({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
    @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
    @JsonKey(name: 'sendInvite') bool? sendInvite,
  }) = _RegisterCaregiverPayload;

  factory RegisterCaregiverPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterCaregiverPayloadFromJson(json);
}
