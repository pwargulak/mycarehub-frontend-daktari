// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyResponseState _$SurveyResponseStateFromJson(Map<String, dynamic> json) {
  return _SurveyResponseState.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponseState {
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyResponse?>? get surveyResponses =>
      throw _privateConstructorUsedError;
  bool? get errorOccurred => throw _privateConstructorUsedError;
  bool? get timeOutOccurred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyResponseStateCopyWith<SurveyResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseStateCopyWith<$Res> {
  factory $SurveyResponseStateCopyWith(
          SurveyResponseState value, $Res Function(SurveyResponseState) then) =
      _$SurveyResponseStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listSurveyResponses')
          List<SurveyResponse?>? surveyResponses,
      bool? errorOccurred,
      bool? timeOutOccurred});
}

/// @nodoc
class _$SurveyResponseStateCopyWithImpl<$Res>
    implements $SurveyResponseStateCopyWith<$Res> {
  _$SurveyResponseStateCopyWithImpl(this._value, this._then);

  final SurveyResponseState _value;
  // ignore: unused_field
  final $Res Function(SurveyResponseState) _then;

  @override
  $Res call({
    Object? surveyResponses = freezed,
    Object? errorOccurred = freezed,
    Object? timeOutOccurred = freezed,
  }) {
    return _then(_value.copyWith(
      surveyResponses: surveyResponses == freezed
          ? _value.surveyResponses
          : surveyResponses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponse?>?,
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
abstract class _$$_SurveyResponseStateCopyWith<$Res>
    implements $SurveyResponseStateCopyWith<$Res> {
  factory _$$_SurveyResponseStateCopyWith(_$_SurveyResponseState value,
          $Res Function(_$_SurveyResponseState) then) =
      __$$_SurveyResponseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listSurveyResponses')
          List<SurveyResponse?>? surveyResponses,
      bool? errorOccurred,
      bool? timeOutOccurred});
}

/// @nodoc
class __$$_SurveyResponseStateCopyWithImpl<$Res>
    extends _$SurveyResponseStateCopyWithImpl<$Res>
    implements _$$_SurveyResponseStateCopyWith<$Res> {
  __$$_SurveyResponseStateCopyWithImpl(_$_SurveyResponseState _value,
      $Res Function(_$_SurveyResponseState) _then)
      : super(_value, (v) => _then(v as _$_SurveyResponseState));

  @override
  _$_SurveyResponseState get _value => super._value as _$_SurveyResponseState;

  @override
  $Res call({
    Object? surveyResponses = freezed,
    Object? errorOccurred = freezed,
    Object? timeOutOccurred = freezed,
  }) {
    return _then(_$_SurveyResponseState(
      surveyResponses: surveyResponses == freezed
          ? _value._surveyResponses
          : surveyResponses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponse?>?,
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
class _$_SurveyResponseState implements _SurveyResponseState {
  _$_SurveyResponseState(
      {@JsonKey(name: 'listSurveyResponses')
          final List<SurveyResponse?>? surveyResponses,
      this.errorOccurred,
      this.timeOutOccurred})
      : _surveyResponses = surveyResponses;

  factory _$_SurveyResponseState.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyResponseStateFromJson(json);

  final List<SurveyResponse?>? _surveyResponses;
  @override
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyResponse?>? get surveyResponses {
    final value = _surveyResponses;
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
    return 'SurveyResponseState(surveyResponses: $surveyResponses, errorOccurred: $errorOccurred, timeOutOccurred: $timeOutOccurred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyResponseState &&
            const DeepCollectionEquality()
                .equals(other._surveyResponses, _surveyResponses) &&
            const DeepCollectionEquality()
                .equals(other.errorOccurred, errorOccurred) &&
            const DeepCollectionEquality()
                .equals(other.timeOutOccurred, timeOutOccurred));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyResponses),
      const DeepCollectionEquality().hash(errorOccurred),
      const DeepCollectionEquality().hash(timeOutOccurred));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyResponseStateCopyWith<_$_SurveyResponseState> get copyWith =>
      __$$_SurveyResponseStateCopyWithImpl<_$_SurveyResponseState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyResponseStateToJson(this);
  }
}

abstract class _SurveyResponseState implements SurveyResponseState {
  factory _SurveyResponseState(
      {@JsonKey(name: 'listSurveyResponses')
          final List<SurveyResponse?>? surveyResponses,
      final bool? errorOccurred,
      final bool? timeOutOccurred}) = _$_SurveyResponseState;

  factory _SurveyResponseState.fromJson(Map<String, dynamic> json) =
      _$_SurveyResponseState.fromJson;

  @override
  @JsonKey(name: 'listSurveyResponses')
  List<SurveyResponse?>? get surveyResponses =>
      throw _privateConstructorUsedError;
  @override
  bool? get errorOccurred => throw _privateConstructorUsedError;
  @override
  bool? get timeOutOccurred => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyResponseStateCopyWith<_$_SurveyResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}
