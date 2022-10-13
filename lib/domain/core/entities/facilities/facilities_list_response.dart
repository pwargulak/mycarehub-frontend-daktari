// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

part 'facilities_list_response.freezed.dart';
part 'facilities_list_response.g.dart';

@freezed
class FacilitiesListResponse
    with _$FacilitiesListResponse {
  factory FacilitiesListResponse({
    @JsonKey(name: 'Facilities') List<Facility>? facilities,
  }) = _FacilitiesListResponse;

  factory FacilitiesListResponse.fromJson(
          Map<String, dynamic> json,) =>
      _$FacilitiesListResponseFromJson(json);
}
