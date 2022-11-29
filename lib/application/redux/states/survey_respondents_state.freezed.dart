// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_respondents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyRespondentsState _$SurveyRespondentsStateFromJson(
    Map<String, dynamic> json) {
  return _SurveyRespondentsState.fromJson(json);
}

/// @nodoc
mixin _$SurveyRespondentsState {
  @JsonKey(name: 'surveyRespondents')
  List<SurveyRespondent?>? get surveyRespondents =>
      throw _privateConstructorUsedError;
  bool? get errorOccurred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyRespondentsStateCopyWith<SurveyRespondentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyRespondentsStateCopyWith<$Res> {
  factory $SurveyRespondentsStateCopyWith(SurveyRespondentsState value,
          $Res Function(SurveyRespondentsState) then) =
      _$SurveyRespondentsStateCopyWithImpl<$Res, SurveyRespondentsState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'surveyRespondents')
          List<SurveyRespondent?>? surveyRespondents,
      bool? errorOccurred});
}

/// @nodoc
class _$SurveyRespondentsStateCopyWithImpl<$Res,
        $Val extends SurveyRespondentsState>
    implements $SurveyRespondentsStateCopyWith<$Res> {
  _$SurveyRespondentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorOccurred = freezed,
  }) {
    return _then(_value.copyWith(
      surveyRespondents: freezed == surveyRespondents
          ? _value.surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorOccurred: freezed == errorOccurred
          ? _value.errorOccurred
          : errorOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyRespondentsStateCopyWith<$Res>
    implements $SurveyRespondentsStateCopyWith<$Res> {
  factory _$$_SurveyRespondentsStateCopyWith(_$_SurveyRespondentsState value,
          $Res Function(_$_SurveyRespondentsState) then) =
      __$$_SurveyRespondentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'surveyRespondents')
          List<SurveyRespondent?>? surveyRespondents,
      bool? errorOccurred});
}

/// @nodoc
class __$$_SurveyRespondentsStateCopyWithImpl<$Res>
    extends _$SurveyRespondentsStateCopyWithImpl<$Res,
        _$_SurveyRespondentsState>
    implements _$$_SurveyRespondentsStateCopyWith<$Res> {
  __$$_SurveyRespondentsStateCopyWithImpl(_$_SurveyRespondentsState _value,
      $Res Function(_$_SurveyRespondentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorOccurred = freezed,
  }) {
    return _then(_$_SurveyRespondentsState(
      surveyRespondents: freezed == surveyRespondents
          ? _value._surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorOccurred: freezed == errorOccurred
          ? _value.errorOccurred
          : errorOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyRespondentsState implements _SurveyRespondentsState {
  _$_SurveyRespondentsState(
      {@JsonKey(name: 'surveyRespondents')
          final List<SurveyRespondent?>? surveyRespondents,
      this.errorOccurred})
      : _surveyRespondents = surveyRespondents;

  factory _$_SurveyRespondentsState.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyRespondentsStateFromJson(json);

  final List<SurveyRespondent?>? _surveyRespondents;
  @override
  @JsonKey(name: 'surveyRespondents')
  List<SurveyRespondent?>? get surveyRespondents {
    final value = _surveyRespondents;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? errorOccurred;

  @override
  String toString() {
    return 'SurveyRespondentsState(surveyRespondents: $surveyRespondents, errorOccurred: $errorOccurred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyRespondentsState &&
            const DeepCollectionEquality()
                .equals(other._surveyRespondents, _surveyRespondents) &&
            (identical(other.errorOccurred, errorOccurred) ||
                other.errorOccurred == errorOccurred));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_surveyRespondents), errorOccurred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyRespondentsStateCopyWith<_$_SurveyRespondentsState> get copyWith =>
      __$$_SurveyRespondentsStateCopyWithImpl<_$_SurveyRespondentsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyRespondentsStateToJson(
      this,
    );
  }
}

abstract class _SurveyRespondentsState implements SurveyRespondentsState {
  factory _SurveyRespondentsState(
      {@JsonKey(name: 'surveyRespondents')
          final List<SurveyRespondent?>? surveyRespondents,
      final bool? errorOccurred}) = _$_SurveyRespondentsState;

  factory _SurveyRespondentsState.fromJson(Map<String, dynamic> json) =
      _$_SurveyRespondentsState.fromJson;

  @override
  @JsonKey(name: 'surveyRespondents')
  List<SurveyRespondent?>? get surveyRespondents;
  @override
  bool? get errorOccurred;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyRespondentsStateCopyWith<_$_SurveyRespondentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
