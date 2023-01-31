// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class UpdateFacilitiesStateAction extends ReduxAction<AppState> {
  UpdateFacilitiesStateAction({
    this.programFacilities,
    this.selectedFacility,
    this.errorGettingFacilities,
  });

  final List<Facility>? programFacilities;
  final Facility? selectedFacility;
  final bool? errorGettingFacilities;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        facilitiesState: state.userProfileState?.facilitiesState?.copyWith.call(
          programFacilities: programFacilities ??
              state.userProfileState?.facilitiesState?.programFacilities,
          selectedFacility: selectedFacility ??
              state.userProfileState?.facilitiesState?.selectedFacility,
          errorGettingFacilities: errorGettingFacilities ??
              state.userProfileState?.facilitiesState?.errorGettingFacilities,
        ),
      ),
    );

    return newState;
  }
}
