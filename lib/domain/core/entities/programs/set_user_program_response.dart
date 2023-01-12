// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/staff_profile_response.dart';

part 'set_user_program_response.freezed.dart';
part 'set_user_program_response.g.dart';

@freezed
class SetUserProgramResponse with _$SetUserProgramResponse {
  factory SetUserProgramResponse({
    @JsonKey(name: 'staffProfile') StaffProfileResponse? staffProfile,
    @JsonKey(name: 'communityToken') String? communityToken,
  }) = _SetUserProgramResponse;

  factory SetUserProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserProgramResponseFromJson(json);
}
