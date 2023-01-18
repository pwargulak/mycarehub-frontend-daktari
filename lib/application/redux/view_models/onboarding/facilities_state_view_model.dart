import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

class FacilitiesStateViewModel extends Vm {
  FacilitiesStateViewModel({
    required this.wait,
    this.programFacilities,
    this.selectedFacility,
    this.errorGettingFacilities,
  }) : super(
          equals: <Object?>[
            wait,
            programFacilities,
            selectedFacility,
            errorGettingFacilities
          ],
        );

  final Wait wait;
  final List<Facility>? programFacilities;
  final Facility? selectedFacility;
  final bool? errorGettingFacilities;

  factory FacilitiesStateViewModel.fromStore(Store<AppState> store) {
    return FacilitiesStateViewModel(
      wait: store.state.wait!,
      programFacilities:
          store.state.userProfileState?.facilitiesState?.programFacilities,
      selectedFacility:
          store.state.userProfileState?.facilitiesState?.selectedFacility,
      errorGettingFacilities:
          store.state.userProfileState?.facilitiesState?.errorGettingFacilities,
    );
  }
}
