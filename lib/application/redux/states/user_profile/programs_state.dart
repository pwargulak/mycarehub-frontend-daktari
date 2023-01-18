import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

part 'programs_state.freezed.dart';
part 'programs_state.g.dart';

@freezed
class ProgramsState with _$ProgramsState {
  factory ProgramsState({
    List<Program>? userPrograms,
    Program? selectedProgram,
    bool? errorGettingPrograms,
  }) = _ProgramsState;

  factory ProgramsState.fromJson(Map<String, dynamic> json) =>
      _$ProgramsStateFromJson(json);

  factory ProgramsState.initial() => ProgramsState(
        userPrograms: <Program>[],
        selectedProgram: Program.initial(),
        errorGettingPrograms: false,
      );
}
