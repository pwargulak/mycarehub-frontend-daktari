import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

class ListFacilitiesViewModel extends Vm {
  ListFacilitiesViewModel({
    required this.wait,
    this.facilities,
    this.linkedFacilities,
    this.updateFacility,
    required this.selectedFacility,
  }) : super(
          equals: <Object?>[
            wait,
            facilities,
            linkedFacilities,
            selectedFacility,
            updateFacility,
          ],
        );

  final Wait wait;
  final List<Facility>? facilities;
  final List<Facility>? linkedFacilities;
  final Facility selectedFacility;
  final bool? updateFacility;

  factory ListFacilitiesViewModel.fromStore(Store<AppState> store) {
    return ListFacilitiesViewModel(
      wait: store.state.wait!,
      facilities: store.state.userProfileState?.facilities,
      linkedFacilities: store.state.userProfileState?.linkedFacilities,
      updateFacility: store.state.miscState?.updateFacility,
      selectedFacility:
          store.state.miscState?.selectedFacility ?? Facility.initial(),
    );
  }
}
