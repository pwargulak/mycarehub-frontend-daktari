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
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyRespondent?>? get surveyRespondents =>
      throw _privateConstructorUsedError;
  bool? get errorOccurred => throw _privateConstructorUsedError;
  bool? get timeOutOccurred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyRespondentsStateCopyWith<SurveyRespondentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyRespondentsStateCopyWith<$Res> {
  factory $SurveyRespondentsStateCopyWith(SurveyRespondentsState value,
          $Res Function(SurveyRespondentsState) then) =
      _$SurveyRespondentsStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listSurveyResponses')
          List<SurveyRespondent?>? surveyRespondents,
      bool? errorOccurred,
      bool? timeOutOccurred});
}

/// @nodoc
class _$SurveyRespondentsStateCopyWithImpl<$Res>
    implements $SurveyRespondentsStateCopyWith<$Res> {
  _$SurveyRespondentsStateCopyWithImpl(this._value, this._then);

  final SurveyRespondentsState _value;
  // ignore: unused_field
  final $Res Function(SurveyRespondentsState) _then;

  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorOccurred = freezed,
    Object? timeOutOccurred = freezed,
  }) {
    return _then(_value.copyWith(
      surveyRespondents: surveyRespondents == freezed
          ? _value.surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorOccurred: errorOccurred == freezed
          ? _value.errorOccurred
          : errorOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeOutOccurred: timeOutOccurred == freezed
          ? _value.timeOutOccurred
          : timeOutOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyRespondentsStateCopyWith<$Res>
    implements $SurveyRespondentsStateCopyWith<$Res> {
  factory _$$_SurveyRespondentsStateCopyWith(_$_SurveyRespondentsState value,
          $Res Function(_$_SurveyRespondentsState) then) =
      __$$_SurveyRespondentsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listSurveyResponses')
          List<SurveyRespondent?>? surveyRespondents,
      bool? errorOccurred,
      bool? timeOutOccurred});
}

/// @nodoc
class __$$_SurveyRespondentsStateCopyWithImpl<$Res>
    extends _$SurveyRespondentsStateCopyWithImpl<$Res>
    implements _$$_SurveyRespondentsStateCopyWith<$Res> {
  __$$_SurveyRespondentsStateCopyWithImpl(_$_SurveyRespondentsState _value,
      $Res Function(_$_SurveyRespondentsState) _then)
      : super(_value, (v) => _then(v as _$_SurveyRespondentsState));

  @override
  _$_SurveyRespondentsState get _value =>
      super._value as _$_SurveyRespondentsState;

  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorOccurred = freezed,
    Object? timeOutOccurred = freezed,
  }) {
    return _then(_$_SurveyRespondentsState(
      surveyRespondents: surveyRespondents == freezed
          ? _value._surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorOccurred: errorOccurred == freezed
          ? _value.errorOccurred
          : errorOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeOutOccurred: timeOutOccurred == freezed
          ? _value.timeOutOccurred
          : timeOutOccurred // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyRespondentsState implements _SurveyRespondentsState {
  _$_SurveyRespondentsState(
      {@JsonKey(name: 'listSurveyResponses')
          final List<SurveyRespondent?>? surveyRespondents,
      this.errorOccurred,
      this.timeOutOccurred})
      : _surveyRespondents = surveyRespondents;

  factory _$_SurveyRespondentsState.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyRespondentsStateFromJson(json);

  final List<SurveyRespondent?>? _surveyRespondents;
  @override
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyRespondent?>? get surveyRespondents {
    final value = _surveyRespondents;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? errorOccurred;
  @override
  final bool? timeOutOccurred;

  @override
  String toString() {
    return 'SurveyRespondentsState(surveyRespondents: $surveyRespondents, errorOccurred: $errorOccurred, timeOutOccurred: $timeOutOccurred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyRespondentsState &&
            const DeepCollectionEquality()
                .equals(other._surveyRespondents, _surveyRespondents) &&
            const DeepCollectionEquality()
                .equals(other.errorOccurred, errorOccurred) &&
            const DeepCollectionEquality()
                .equals(other.timeOutOccurred, timeOutOccurred));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyRespondents),
      const DeepCollectionEquality().hash(errorOccurred),
      const DeepCollectionEquality().hash(timeOutOccurred));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyRespondentsStateCopyWith<_$_SurveyRespondentsState> get copyWith =>
      __$$_SurveyRespondentsStateCopyWithImpl<_$_SurveyRespondentsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyRespondentsStateToJson(this);
  }
}

abstract class _SurveyRespondentsState implements SurveyRespondentsState {
  factory _SurveyRespondentsState(
      {@JsonKey(name: 'listSurveyResponses')
          final List<SurveyRespondent?>? surveyRespondents,
      final bool? errorOccurred,
      final bool? timeOutOccurred}) = _$_SurveyRespondentsState;

  factory _SurveyRespondentsState.fromJson(Map<String, dynamic> json) =
      _$_SurveyRespondentsState.fromJson;

  @override
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyRespondent?>? get surveyRespondents =>
      throw _privateConstructorUsedError;
  @override
  bool? get errorOccurred => throw _privateConstructorUsedError;
  @override
  bool? get timeOutOccurred => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyRespondentsStateCopyWith<_$_SurveyRespondentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
