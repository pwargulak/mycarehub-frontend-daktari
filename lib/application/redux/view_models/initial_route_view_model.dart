import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

class InitialRouteViewModel extends Vm {
  InitialRouteViewModel({
    this.selectedProgram,
    this.initialRoute,
    this.currentIndex,
  }) : super(equals: <Object?>[initialRoute, currentIndex, selectedProgram]);

  final String? initialRoute;
  final int? currentIndex;
  final Program? selectedProgram;

  factory InitialRouteViewModel.fromStore(AppState state) {
    return InitialRouteViewModel(
      initialRoute: state.miscState?.initialRoute,
      currentIndex: state.bottomNavigationState?.currentBottomNavIndex,
      selectedProgram: state.userProfileState?.programsState?.selectedProgram,
    );
  }
}
