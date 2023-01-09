// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class UpdateProgramsStateAction extends ReduxAction<AppState> {
  UpdateProgramsStateAction({
    this.selectedProgram,
    this.userPrograms,
  });

  final Program? selectedProgram;
  final List<Program>? userPrograms;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        programsState: state.userProfileState?.programsState?.copyWith.call(
          selectedProgram: selectedProgram ?? state.userProfileState?.programsState?.selectedProgram,
          userPrograms: userPrograms ?? state.userProfileState?.programsState?.userPrograms,
        ),
      ),
    );

    return newState;
  }
}
