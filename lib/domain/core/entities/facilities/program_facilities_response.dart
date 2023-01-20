// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_facilities_response.freezed.dart';
part 'program_facilities_response.g.dart';

@freezed
class ProgramFacilitiesResponse with _$ProgramFacilitiesResponse {
  factory ProgramFacilitiesResponse({
    @JsonKey(name: 'facilities') List<Facility>? facilities,
  }) = _ProgramFacilitiesResponse;

  factory ProgramFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramFacilitiesResponseFromJson(json);
}
