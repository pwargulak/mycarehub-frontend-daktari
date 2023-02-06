import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

part 'programs_state.freezed.dart';
part 'programs_state.g.dart';

@freezed
class ProgramsState with _$ProgramsState {
  factory ProgramsState({
    List<Program>? userPrograms,
    List<Program>? programs,
    Program? selectedProgram,
    Program? selectedUserProgram,
    bool? errorGettingPrograms,
  }) = _ProgramsState;

  factory ProgramsState.fromJson(Map<String, dynamic> json) =>
      _$ProgramsStateFromJson(json);

  factory ProgramsState.initial() => ProgramsState(
        userPrograms: <Program>[],
        programs: <Program>[],
        selectedProgram: Program.initial(),
        selectedUserProgram: Program.initial(),
        errorGettingPrograms: false,
      );
}
