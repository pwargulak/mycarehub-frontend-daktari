import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

class ProgramsStateViewModel extends Vm {
  ProgramsStateViewModel({
    required this.wait,
    this.userPrograms,
    this.selectedProgram,
    this.errorGettingPrograms,
  }) : super(
          equals: <Object?>[
            wait,
            userPrograms,
            selectedProgram,
            errorGettingPrograms
          ],
        );

  final Wait wait;
  final List<Program>? userPrograms;
  final Program? selectedProgram;
  final bool? errorGettingPrograms;

  factory ProgramsStateViewModel.fromStore(Store<AppState> store) {
    return ProgramsStateViewModel(
      wait: store.state.wait!,
      userPrograms: store.state.userProfileState?.programsState?.userPrograms,
      selectedProgram:
          store.state.userProfileState?.programsState?.selectedProgram,
      errorGettingPrograms:
          store.state.userProfileState?.programsState?.errorGettingPrograms,
    );
  }
}
