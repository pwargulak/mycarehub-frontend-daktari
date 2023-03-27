// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_program_facilities_response.freezed.dart';
part 'list_program_facilities_response.g.dart';

@freezed
class ListProgramFacilitiesResponse with _$ListProgramFacilitiesResponse {
  factory ListProgramFacilitiesResponse({
    @JsonKey(name: 'getProgramFacilities') List<Facility>? programFacilities,
  }) = _ListProgramFacilitiesResponse;

  factory ListProgramFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProgramFacilitiesResponseFromJson(json);
}
