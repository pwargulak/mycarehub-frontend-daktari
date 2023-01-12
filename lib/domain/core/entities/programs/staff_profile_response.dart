// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_profile_response.freezed.dart';
part 'staff_profile_response.g.dart';

@freezed
class StaffProfileResponse with _$StaffProfileResponse {
  factory StaffProfileResponse({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'User') User? user,
    @JsonKey(name: 'StaffNumber') String? staffNumber,
    @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
  }) = _StaffProfileResponse;

  factory StaffProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffProfileResponseFromJson(json);
}
