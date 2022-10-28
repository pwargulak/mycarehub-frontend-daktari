import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

class InitialRouteViewModel extends Vm {
  InitialRouteViewModel({this.currentFacility, this.initialRoute, this.currentIndex})
      : super(equals: <Object?>[initialRoute, currentIndex, currentFacility]);

  final String? initialRoute;
  final int? currentIndex;
  final Facility? currentFacility;

  factory InitialRouteViewModel.fromStore(AppState state) {
    return InitialRouteViewModel(
      initialRoute: state.miscState?.initialRoute,
      currentIndex: state.bottomNavigationState?.currentBottomNavIndex,
      currentFacility: state.staffState?.currentFacility,
    );
  }
}
