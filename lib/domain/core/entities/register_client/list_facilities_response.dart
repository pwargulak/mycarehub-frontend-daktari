// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';

part 'list_facilities_response.freezed.dart';
part 'list_facilities_response.g.dart';

@freezed
class ListFacilitiesResponse with _$ListFacilitiesResponse {
  factory ListFacilitiesResponse({
    @JsonKey(name: 'Facilities') List<Facility>? facilities,
  }) = _ListFacilitiesResponse;

  factory ListFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFacilitiesResponseFromJson(json);
}
