import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_organisation_input_payload.freezed.dart';
part 'register_organisation_input_payload.g.dart';

@freezed
class RegisterOrganisationInputPayload with _$RegisterOrganisationInputPayload {
  factory RegisterOrganisationInputPayload({
    @JsonKey(name: 'code') String? registrationNumber,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'defaultCountry') String? country,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'emailAddress') String? emailAddress,
    @JsonKey(name: 'postalAddress') String? postalAddress,
    @JsonKey(name: 'physicalAddress') String? physicalAddress,
  }) = _RegisterOrganisationInputPayload;

  factory RegisterOrganisationInputPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterOrganisationInputPayloadFromJson(json);
}
