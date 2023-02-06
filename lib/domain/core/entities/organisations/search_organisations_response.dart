import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_organisations_response.freezed.dart';
part 'search_organisations_response.g.dart';

@freezed
class SearchOrganisationsResponse with _$SearchOrganisationsResponse {
  factory SearchOrganisationsResponse({
    @JsonKey(name: 'searchOrganisations') List<Organisation>? organisations,
  }) = _SearchOrganisationsResponse;

  factory SearchOrganisationsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchOrganisationsResponseFromJson(json);
}
