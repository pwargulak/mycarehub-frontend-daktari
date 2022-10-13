// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facilities_list_response.dart';

part 'fetch_user_linked_facilities_response.freezed.dart';
part 'fetch_user_linked_facilities_response.g.dart';

@freezed
class FetchUserLinkedFacilitiesResponse with _$FetchUserLinkedFacilitiesResponse {
  factory FetchUserLinkedFacilitiesResponse({
    @JsonKey(name: 'getUserLinkedFacilities') FacilitiesListResponse? facilitiesListResponse,
  }) = _FetchUserLinkedFacilitiesResponse;

  factory FetchUserLinkedFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchUserLinkedFacilitiesResponseFromJson(json);
}
