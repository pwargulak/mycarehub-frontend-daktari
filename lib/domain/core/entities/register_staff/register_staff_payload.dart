import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';

part 'register_staff_payload.freezed.dart';
part 'register_staff_payload.g.dart';

@freezed
class RegisterStaffPayload with _$RegisterStaffPayload {
  factory RegisterStaffPayload({
    @JsonKey(name: 'facility') String? facility,
    @JsonKey(name: 'staffName') String? staffName,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'idNumber') String? idNumber,
    @JsonKey(name: 'staffNumber') String? staffNumber,
    @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson) RoleValue? role,
    @JsonKey(name: 'inviteStaff') bool? inviteStaff,
    @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
  }) = _RegisterStaffPayload;

  factory RegisterStaffPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterStaffPayloadFromJson(json);
}
