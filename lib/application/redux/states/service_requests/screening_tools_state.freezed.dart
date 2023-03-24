// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tools_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningToolsState _$ScreeningToolsStateFromJson(Map<String, dynamic> json) {
  return _ScreeningToolsState.fromJson(json);
}

/// @nodoc
mixin _$ScreeningToolsState {
  List<ScreeningTool>? get availableTools => throw _privateConstructorUsedError;
  List<ScreeningToolRespondent>? get screeningToolRespondents =>
      throw _privateConstructorUsedError;
  ScreeningToolRespondent? get selectedRespondent =>
      throw _privateConstructorUsedError;
  ScreeningToolQuestionResponses? get screeningToolQuestionResponses =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingScreeningTools => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolsStateCopyWith<ScreeningToolsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolsStateCopyWith<$Res> {
  factory $ScreeningToolsStateCopyWith(
          ScreeningToolsState value, $Res Function(ScreeningToolsState) then) =
      _$ScreeningToolsStateCopyWithImpl<$Res, ScreeningToolsState>;
  @useResult
  $Res call(
      {List<ScreeningTool>? availableTools,
      List<ScreeningToolRespondent>? screeningToolRespondents,
      ScreeningToolRespondent? selectedRespondent,
      ScreeningToolQuestionResponses? screeningToolQuestionResponses,
      bool? errorFetchingScreeningTools});

  $ScreeningToolRespondentCopyWith<$Res>? get selectedRespondent;
  $ScreeningToolQuestionResponsesCopyWith<$Res>?
      get screeningToolQuestionResponses;
}

/// @nodoc
class _$ScreeningToolsStateCopyWithImpl<$Res, $Val extends ScreeningToolsState>
    implements $ScreeningToolsStateCopyWith<$Res> {
  _$ScreeningToolsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTools = freezed,
    Object? screeningToolRespondents = freezed,
    Object? selectedRespondent = freezed,
    Object? screeningToolQuestionResponses = freezed,
    Object? errorFetchingScreeningTools = freezed,
  }) {
    return _then(_value.copyWith(
      availableTools: freezed == availableTools
          ? _value.availableTools
          : availableTools // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTool>?,
      screeningToolRespondents: freezed == screeningToolRespondents
          ? _value.screeningToolRespondents
          : screeningToolRespondents // ignore: cast_nullable_to_non_nullable
              as List<ScreeningToolRespondent>?,
      selectedRespondent: freezed == selectedRespondent
          ? _value.selectedRespondent
          : selectedRespondent // ignore: cast_nullable_to_non_nullable
              as ScreeningToolRespondent?,
      screeningToolQuestionResponses: freezed == screeningToolQuestionResponses
          ? _value.screeningToolQuestionResponses
          : screeningToolQuestionResponses // ignore: cast_nullable_to_non_nullable
              as ScreeningToolQuestionResponses?,
      errorFetchingScreeningTools: freezed == errorFetchingScreeningTools
          ? _value.errorFetchingScreeningTools
          : errorFetchingScreeningTools // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningToolRespondentCopyWith<$Res>? get selectedRespondent {
    if (_value.selectedRespondent == null) {
      return null;
    }

    return $ScreeningToolRespondentCopyWith<$Res>(_value.selectedRespondent!,
        (value) {
      return _then(_value.copyWith(selectedRespondent: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningToolQuestionResponsesCopyWith<$Res>?
      get screeningToolQuestionResponses {
    if (_value.screeningToolQuestionResponses == null) {
      return null;
    }

    return $ScreeningToolQuestionResponsesCopyWith<$Res>(
        _value.screeningToolQuestionResponses!, (value) {
      return _then(
          _value.copyWith(screeningToolQuestionResponses: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ScreeningToolsStateCopyWith<$Res>
    implements $ScreeningToolsStateCopyWith<$Res> {
  factory _$$_ScreeningToolsStateCopyWith(_$_ScreeningToolsState value,
          $Res Function(_$_ScreeningToolsState) then) =
      __$$_ScreeningToolsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScreeningTool>? availableTools,
      List<ScreeningToolRespondent>? screeningToolRespondents,
      ScreeningToolRespondent? selectedRespondent,
      ScreeningToolQuestionResponses? screeningToolQuestionResponses,
      bool? errorFetchingScreeningTools});

  @override
  $ScreeningToolRespondentCopyWith<$Res>? get selectedRespondent;
  @override
  $ScreeningToolQuestionResponsesCopyWith<$Res>?
      get screeningToolQuestionResponses;
}

/// @nodoc
class __$$_ScreeningToolsStateCopyWithImpl<$Res>
    extends _$ScreeningToolsStateCopyWithImpl<$Res, _$_ScreeningToolsState>
    implements _$$_ScreeningToolsStateCopyWith<$Res> {
  __$$_ScreeningToolsStateCopyWithImpl(_$_ScreeningToolsState _value,
      $Res Function(_$_ScreeningToolsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTools = freezed,
    Object? screeningToolRespondents = freezed,
    Object? selectedRespondent = freezed,
    Object? screeningToolQuestionResponses = freezed,
    Object? errorFetchingScreeningTools = freezed,
  }) {
    return _then(_$_ScreeningToolsState(
      availableTools: freezed == availableTools
          ? _value.availableTools
          : availableTools // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTool>?,
      screeningToolRespondents: freezed == screeningToolRespondents
          ? _value.screeningToolRespondents
          : screeningToolRespondents // ignore: cast_nullable_to_non_nullable
              as List<ScreeningToolRespondent>?,
      selectedRespondent: freezed == selectedRespondent
          ? _value.selectedRespondent
          : selectedRespondent // ignore: cast_nullable_to_non_nullable
              as ScreeningToolRespondent?,
      screeningToolQuestionResponses: freezed == screeningToolQuestionResponses
          ? _value.screeningToolQuestionResponses
          : screeningToolQuestionResponses // ignore: cast_nullable_to_non_nullable
              as ScreeningToolQuestionResponses?,
      errorFetchingScreeningTools: freezed == errorFetchingScreeningTools
          ? _value.errorFetchingScreeningTools
          : errorFetchingScreeningTools // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningToolsState implements _ScreeningToolsState {
  _$_ScreeningToolsState(
      {this.availableTools,
      this.screeningToolRespondents,
      this.selectedRespondent,
      this.screeningToolQuestionResponses,
      this.errorFetchingScreeningTools});

  factory _$_ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolsStateFromJson(json);

  @override
  final List<ScreeningTool>? availableTools;
  @override
  final List<ScreeningToolRespondent>? screeningToolRespondents;
  @override
  final ScreeningToolRespondent? selectedRespondent;
  @override
  final ScreeningToolQuestionResponses? screeningToolQuestionResponses;
  @override
  final bool? errorFetchingScreeningTools;

  @override
  String toString() {
    return 'ScreeningToolsState(availableTools: $availableTools, screeningToolRespondents: $screeningToolRespondents, selectedRespondent: $selectedRespondent, screeningToolQuestionResponses: $screeningToolQuestionResponses, errorFetchingScreeningTools: $errorFetchingScreeningTools)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningToolsState &&
            const DeepCollectionEquality()
                .equals(other.availableTools, availableTools) &&
            const DeepCollectionEquality().equals(
                other.screeningToolRespondents, screeningToolRespondents) &&
            (identical(other.selectedRespondent, selectedRespondent) ||
                other.selectedRespondent == selectedRespondent) &&
            (identical(other.screeningToolQuestionResponses,
                    screeningToolQuestionResponses) ||
                other.screeningToolQuestionResponses ==
                    screeningToolQuestionResponses) &&
            (identical(other.errorFetchingScreeningTools,
                    errorFetchingScreeningTools) ||
                other.errorFetchingScreeningTools ==
                    errorFetchingScreeningTools));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableTools),
      const DeepCollectionEquality().hash(screeningToolRespondents),
      selectedRespondent,
      screeningToolQuestionResponses,
      errorFetchingScreeningTools);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningToolsStateCopyWith<_$_ScreeningToolsState> get copyWith =>
      __$$_ScreeningToolsStateCopyWithImpl<_$_ScreeningToolsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolsStateToJson(
      this,
    );
  }
}

abstract class _ScreeningToolsState implements ScreeningToolsState {
  factory _ScreeningToolsState(
      {final List<ScreeningTool>? availableTools,
      final List<ScreeningToolRespondent>? screeningToolRespondents,
      final ScreeningToolRespondent? selectedRespondent,
      final ScreeningToolQuestionResponses? screeningToolQuestionResponses,
      final bool? errorFetchingScreeningTools}) = _$_ScreeningToolsState;

  factory _ScreeningToolsState.fromJson(Map<String, dynamic> json) =
      _$_ScreeningToolsState.fromJson;

  @override
  List<ScreeningTool>? get availableTools;
  @override
  List<ScreeningToolRespondent>? get screeningToolRespondents;
  @override
  ScreeningToolRespondent? get selectedRespondent;
  @override
  ScreeningToolQuestionResponses? get screeningToolQuestionResponses;
  @override
  bool? get errorFetchingScreeningTools;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolsStateCopyWith<_$_ScreeningToolsState> get copyWith =>
      throw _privateConstructorUsedError;
}
