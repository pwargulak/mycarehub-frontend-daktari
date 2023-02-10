// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class UpdateProgramsStateAction extends ReduxAction<AppState> {
  UpdateProgramsStateAction({
    this.selectedProgram,
    this.selectedUserProgram,
    this.userPrograms,
    this.errorGettingPrograms,
    this.programs,
  });

  final Program? selectedProgram;
  final Program? selectedUserProgram;
  final List<Program>? userPrograms;
  final List<Program>? programs;
  final bool? errorGettingPrograms;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        programsState: state.userProfileState?.programsState?.copyWith.call(
          selectedUserProgram: selectedUserProgram ??
              state.userProfileState?.programsState?.selectedUserProgram,
          userPrograms: userPrograms ??
              state.userProfileState?.programsState?.userPrograms,
          programs: programs ?? state.userProfileState?.programsState?.programs,
          errorGettingPrograms: errorGettingPrograms ??
              state.userProfileState?.programsState?.errorGettingPrograms,
          selectedProgram: selectedProgram ??
              state.userProfileState?.programsState?.selectedProgram,
        ),
      ),
    );

    return newState;
  }
}
