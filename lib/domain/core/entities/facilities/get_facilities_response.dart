import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/linked_facilities.dart';

part 'get_facilities_response.freezed.dart';
part 'get_facilities_response.g.dart';

@freezed
class GetFacilitiesResponse with _$GetFacilitiesResponse {
  factory GetFacilitiesResponse({
    @JsonKey(name: 'getStaffFacilities') LinkedFacilities? staffLinkedFacilities,
    @JsonKey(name: 'getClientFacilities') LinkedFacilities? clientLinkedFacilities,
  }) = _GetFacilitiesResponse;

  factory GetFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFacilitiesResponseFromJson(json);
}
