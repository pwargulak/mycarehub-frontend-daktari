// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_profile_response.freezed.dart';
part 'staff_profile_response.g.dart';

@freezed
class StaffProfileResponse with _$StaffProfileResponse {
  factory StaffProfileResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'staffNumber') String? staffNumber,
    @JsonKey(name: 'defaultFacility') Facility? defaultFacility,
  }) = _StaffProfileResponse;

  factory StaffProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffProfileResponseFromJson(json);
}
