import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/assigned_client.dart';

part 'register_caregiver_payload.freezed.dart';
part 'register_caregiver_payload.g.dart';

@freezed
class RegisterCaregiverPayload with _$RegisterCaregiverPayload {
  @JsonSerializable(explicitToJson: true)
  factory RegisterCaregiverPayload({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
    @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
    @JsonKey(name: 'sendInvite') bool? sendInvite,
    @JsonKey(name: 'assignedClients') List<AssignedClient>? assignedClients,
  }) = _RegisterCaregiverPayload;

  factory RegisterCaregiverPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterCaregiverPayloadFromJson(json);
}
