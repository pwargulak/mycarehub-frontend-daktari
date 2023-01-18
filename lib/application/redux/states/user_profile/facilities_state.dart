import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

part 'facilities_state.freezed.dart';
part 'facilities_state.g.dart';
@freezed
class FacilitiesState with _$FacilitiesState {
  factory FacilitiesState({
    List<Facility>? programFacilities,
    Facility? selectedFacility,
    bool? errorGettingFacilities,
  }) = _FacilitiesState;

  factory FacilitiesState.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesStateFromJson(json);

  factory FacilitiesState.initial() => FacilitiesState(
        programFacilities: <Facility>[],
        selectedFacility: Facility.initial(),
        errorGettingFacilities: false,
      );
}
