import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

part 'linked_facilities.freezed.dart';
part 'linked_facilities.g.dart';

@freezed
class LinkedFacilities with _$LinkedFacilities {
  factory LinkedFacilities({
    @JsonKey(name: 'Facilities') List<Facility>? facilities,
  }) = _LinkedFacilities;

  factory LinkedFacilities.fromJson(Map<String, dynamic> json) =>
      _$LinkedFacilitiesFromJson(json);
}
