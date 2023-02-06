// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility_identifier.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
class Facility with _$Facility {
  factory Facility({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'identifier') FacilityIdentifier? facilityIdentifier,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'fhirOrganisationID') String? fhirOrganisationID,
    @JsonKey(name: 'workStationDetails') WorkStationDetails? workStationDetails,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  factory Facility.initial() => Facility(
        id: UNKNOWN,
        name: UNKNOWN,
        phone: UNKNOWN,
        active: false,
        country: UNKNOWN,
        facilityIdentifier: FacilityIdentifier.initial(),
        description: UNKNOWN,
        fhirOrganisationID: UNKNOWN,
        workStationDetails: WorkStationDetails.initial(),
      );
}
