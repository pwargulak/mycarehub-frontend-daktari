import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

class ProgramsStateViewModel extends Vm {
  ProgramsStateViewModel({
    required this.wait,
    this.userPrograms,
    required this.programs,
    required this.selectedPrograms,
    this.selectedUserProgram,
    this.errorGettingPrograms,
  }) : super(
          equals: <Object?>[
            wait,
            userPrograms,
            programs,
            selectedPrograms,
            selectedUserProgram,
            errorGettingPrograms
          ],
        );

  final Wait wait;
  final List<Program>? userPrograms;
  final List<Program> programs;
 final List<Program>? selectedPrograms;
  final Program? selectedUserProgram;
  final bool? errorGettingPrograms;

  factory ProgramsStateViewModel.fromStore(Store<AppState> store) {
    return ProgramsStateViewModel(
      wait: store.state.wait!,
      userPrograms: store.state.userProfileState?.programsState?.userPrograms,
      selectedUserProgram:
          store.state.userProfileState?.programsState?.selectedUserProgram,
      errorGettingPrograms:
          store.state.userProfileState?.programsState?.errorGettingPrograms,
      programs:
          store.state.userProfileState?.programsState?.programs ?? <Program>[],
      selectedPrograms:
          store.state.userProfileState?.programsState?.selectedPrograms,
    );
  }
}
