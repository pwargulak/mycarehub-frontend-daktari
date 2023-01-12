import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';

part 'programs_state.freezed.dart';
part 'programs_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
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
