// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'programs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramsState _$ProgramsStateFromJson(Map<String, dynamic> json) {
  return _ProgramsState.fromJson(json);
}

/// @nodoc
mixin _$ProgramsState {
  List<Program>? get userPrograms => throw _privateConstructorUsedError;
  List<Program>? get programs => throw _privateConstructorUsedError;
  List<Program>? get selectedPrograms => throw _privateConstructorUsedError;
  Program? get selectedUserProgram => throw _privateConstructorUsedError;
  bool? get errorGettingPrograms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramsStateCopyWith<ProgramsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramsStateCopyWith<$Res> {
  factory $ProgramsStateCopyWith(
          ProgramsState value, $Res Function(ProgramsState) then) =
      _$ProgramsStateCopyWithImpl<$Res, ProgramsState>;
  @useResult
  $Res call(
      {List<Program>? userPrograms,
      List<Program>? programs,
      List<Program>? selectedPrograms,
      Program? selectedUserProgram,
      bool? errorGettingPrograms});

  $ProgramCopyWith<$Res>? get selectedUserProgram;
}

/// @nodoc
class _$ProgramsStateCopyWithImpl<$Res, $Val extends ProgramsState>
    implements $ProgramsStateCopyWith<$Res> {
  _$ProgramsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPrograms = freezed,
    Object? programs = freezed,
    Object? selectedPrograms = freezed,
    Object? selectedUserProgram = freezed,
    Object? errorGettingPrograms = freezed,
  }) {
    return _then(_value.copyWith(
      userPrograms: freezed == userPrograms
          ? _value.userPrograms
          : userPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      programs: freezed == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      selectedPrograms: freezed == selectedPrograms
          ? _value.selectedPrograms
          : selectedPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      selectedUserProgram: freezed == selectedUserProgram
          ? _value.selectedUserProgram
          : selectedUserProgram // ignore: cast_nullable_to_non_nullable
              as Program?,
      errorGettingPrograms: freezed == errorGettingPrograms
          ? _value.errorGettingPrograms
          : errorGettingPrograms // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgramCopyWith<$Res>? get selectedUserProgram {
    if (_value.selectedUserProgram == null) {
      return null;
    }

    return $ProgramCopyWith<$Res>(_value.selectedUserProgram!, (value) {
      return _then(_value.copyWith(selectedUserProgram: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProgramsStateCopyWith<$Res>
    implements $ProgramsStateCopyWith<$Res> {
  factory _$$_ProgramsStateCopyWith(
          _$_ProgramsState value, $Res Function(_$_ProgramsState) then) =
      __$$_ProgramsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Program>? userPrograms,
      List<Program>? programs,
      List<Program>? selectedPrograms,
      Program? selectedUserProgram,
      bool? errorGettingPrograms});

  @override
  $ProgramCopyWith<$Res>? get selectedUserProgram;
}

/// @nodoc
class __$$_ProgramsStateCopyWithImpl<$Res>
    extends _$ProgramsStateCopyWithImpl<$Res, _$_ProgramsState>
    implements _$$_ProgramsStateCopyWith<$Res> {
  __$$_ProgramsStateCopyWithImpl(
      _$_ProgramsState _value, $Res Function(_$_ProgramsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPrograms = freezed,
    Object? programs = freezed,
    Object? selectedPrograms = freezed,
    Object? selectedUserProgram = freezed,
    Object? errorGettingPrograms = freezed,
  }) {
    return _then(_$_ProgramsState(
      userPrograms: freezed == userPrograms
          ? _value.userPrograms
          : userPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      programs: freezed == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      selectedPrograms: freezed == selectedPrograms
          ? _value.selectedPrograms
          : selectedPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      selectedUserProgram: freezed == selectedUserProgram
          ? _value.selectedUserProgram
          : selectedUserProgram // ignore: cast_nullable_to_non_nullable
              as Program?,
      errorGettingPrograms: freezed == errorGettingPrograms
          ? _value.errorGettingPrograms
          : errorGettingPrograms // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramsState implements _ProgramsState {
  _$_ProgramsState(
      {this.userPrograms,
      this.programs,
      this.selectedPrograms,
      this.selectedUserProgram,
      this.errorGettingPrograms});

  factory _$_ProgramsState.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramsStateFromJson(json);

  @override
  final List<Program>? userPrograms;
  @override
  final List<Program>? programs;
  @override
  final List<Program>? selectedPrograms;
  @override
  final Program? selectedUserProgram;
  @override
  final bool? errorGettingPrograms;

  @override
  String toString() {
    return 'ProgramsState(userPrograms: $userPrograms, programs: $programs, selectedPrograms: $selectedPrograms, selectedUserProgram: $selectedUserProgram, errorGettingPrograms: $errorGettingPrograms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramsState &&
            const DeepCollectionEquality()
                .equals(other.userPrograms, userPrograms) &&
            const DeepCollectionEquality().equals(other.programs, programs) &&
            const DeepCollectionEquality()
                .equals(other.selectedPrograms, selectedPrograms) &&
            (identical(other.selectedUserProgram, selectedUserProgram) ||
                other.selectedUserProgram == selectedUserProgram) &&
            (identical(other.errorGettingPrograms, errorGettingPrograms) ||
                other.errorGettingPrograms == errorGettingPrograms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userPrograms),
      const DeepCollectionEquality().hash(programs),
      const DeepCollectionEquality().hash(selectedPrograms),
      selectedUserProgram,
      errorGettingPrograms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramsStateCopyWith<_$_ProgramsState> get copyWith =>
      __$$_ProgramsStateCopyWithImpl<_$_ProgramsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramsStateToJson(
      this,
    );
  }
}

abstract class _ProgramsState implements ProgramsState {
  factory _ProgramsState(
      {final List<Program>? userPrograms,
      final List<Program>? programs,
      final List<Program>? selectedPrograms,
      final Program? selectedUserProgram,
      final bool? errorGettingPrograms}) = _$_ProgramsState;

  factory _ProgramsState.fromJson(Map<String, dynamic> json) =
      _$_ProgramsState.fromJson;

  @override
  List<Program>? get userPrograms;
  @override
  List<Program>? get programs;
  @override
  List<Program>? get selectedPrograms;
  @override
  Program? get selectedUserProgram;
  @override
  bool? get errorGettingPrograms;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramsStateCopyWith<_$_ProgramsState> get copyWith =>
      throw _privateConstructorUsedError;
}
