import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_organisations_response.freezed.dart';
part 'list_organisations_response.g.dart';

@freezed
class ListOrganisationsResponse with _$ListOrganisationsResponse {
  factory ListOrganisationsResponse({
    @JsonKey(name: 'organisations') List<Organisation>? organisations,
  }) = _ListOrganisationsResponse;

  factory ListOrganisationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOrganisationsResponseFromJson(json);
}
