// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_service_request_respondents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyServiceRequestRespondentsState
    _$SurveyServiceRequestRespondentsStateFromJson(Map<String, dynamic> json) {
  return _SurveyServiceRequestRespondentsState.fromJson(json);
}

/// @nodoc
mixin _$SurveyServiceRequestRespondentsState {
  @JsonKey(name: 'users')
  List<SurveyRespondent?>? get surveyRespondents =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingSurveys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyServiceRequestRespondentsStateCopyWith<
          SurveyServiceRequestRespondentsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyServiceRequestRespondentsStateCopyWith<$Res> {
  factory $SurveyServiceRequestRespondentsStateCopyWith(
          SurveyServiceRequestRespondentsState value,
          $Res Function(SurveyServiceRequestRespondentsState) then) =
      _$SurveyServiceRequestRespondentsStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'users') List<SurveyRespondent?>? surveyRespondents,
      bool? errorFetchingSurveys});
}

/// @nodoc
class _$SurveyServiceRequestRespondentsStateCopyWithImpl<$Res>
    implements $SurveyServiceRequestRespondentsStateCopyWith<$Res> {
  _$SurveyServiceRequestRespondentsStateCopyWithImpl(this._value, this._then);

  final SurveyServiceRequestRespondentsState _value;
  // ignore: unused_field
  final $Res Function(SurveyServiceRequestRespondentsState) _then;

  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorFetchingSurveys = freezed,
  }) {
    return _then(_value.copyWith(
      surveyRespondents: surveyRespondents == freezed
          ? _value.surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorFetchingSurveys: errorFetchingSurveys == freezed
          ? _value.errorFetchingSurveys
          : errorFetchingSurveys // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyServiceRequestRespondentsStateCopyWith<$Res>
    implements $SurveyServiceRequestRespondentsStateCopyWith<$Res> {
  factory _$$_SurveyServiceRequestRespondentsStateCopyWith(
          _$_SurveyServiceRequestRespondentsState value,
          $Res Function(_$_SurveyServiceRequestRespondentsState) then) =
      __$$_SurveyServiceRequestRespondentsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'users') List<SurveyRespondent?>? surveyRespondents,
      bool? errorFetchingSurveys});
}

/// @nodoc
class __$$_SurveyServiceRequestRespondentsStateCopyWithImpl<$Res>
    extends _$SurveyServiceRequestRespondentsStateCopyWithImpl<$Res>
    implements _$$_SurveyServiceRequestRespondentsStateCopyWith<$Res> {
  __$$_SurveyServiceRequestRespondentsStateCopyWithImpl(
      _$_SurveyServiceRequestRespondentsState _value,
      $Res Function(_$_SurveyServiceRequestRespondentsState) _then)
      : super(
            _value, (v) => _then(v as _$_SurveyServiceRequestRespondentsState));

  @override
  _$_SurveyServiceRequestRespondentsState get _value =>
      super._value as _$_SurveyServiceRequestRespondentsState;

  @override
  $Res call({
    Object? surveyRespondents = freezed,
    Object? errorFetchingSurveys = freezed,
  }) {
    return _then(_$_SurveyServiceRequestRespondentsState(
      surveyRespondents: surveyRespondents == freezed
          ? _value.surveyRespondents
          : surveyRespondents // ignore: cast_nullable_to_non_nullable
              as List<SurveyRespondent?>?,
      errorFetchingSurveys: errorFetchingSurveys == freezed
          ? _value.errorFetchingSurveys
          : errorFetchingSurveys // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyServiceRequestRespondentsState
    implements _SurveyServiceRequestRespondentsState {
  _$_SurveyServiceRequestRespondentsState(
      {@JsonKey(name: 'users') this.surveyRespondents,
      this.errorFetchingSurveys});

  factory _$_SurveyServiceRequestRespondentsState.fromJson(
          Map<String, dynamic> json) =>
      _$$_SurveyServiceRequestRespondentsStateFromJson(json);

  @override
  @JsonKey(name: 'users')
  final List<SurveyRespondent?>? surveyRespondents;
  @override
  final bool? errorFetchingSurveys;

  @override
  String toString() {
    return 'SurveyServiceRequestRespondentsState(surveyRespondents: $surveyRespondents, errorFetchingSurveys: $errorFetchingSurveys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyServiceRequestRespondentsState &&
            const DeepCollectionEquality()
                .equals(other.surveyRespondents, surveyRespondents) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingSurveys, errorFetchingSurveys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(surveyRespondents),
      const DeepCollectionEquality().hash(errorFetchingSurveys));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyServiceRequestRespondentsStateCopyWith<
          _$_SurveyServiceRequestRespondentsState>
      get copyWith => __$$_SurveyServiceRequestRespondentsStateCopyWithImpl<
          _$_SurveyServiceRequestRespondentsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyServiceRequestRespondentsStateToJson(this);
  }
}

abstract class _SurveyServiceRequestRespondentsState
    implements SurveyServiceRequestRespondentsState {
  factory _SurveyServiceRequestRespondentsState(
      {@JsonKey(name: 'users') final List<SurveyRespondent?>? surveyRespondents,
      final bool?
          errorFetchingSurveys}) = _$_SurveyServiceRequestRespondentsState;

  factory _SurveyServiceRequestRespondentsState.fromJson(
          Map<String, dynamic> json) =
      _$_SurveyServiceRequestRespondentsState.fromJson;

  @override
  @JsonKey(name: 'users')
  List<SurveyRespondent?>? get surveyRespondents =>
      throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingSurveys => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyServiceRequestRespondentsStateCopyWith<
          _$_SurveyServiceRequestRespondentsState>
      get copyWith => throw _privateConstructorUsedError;
}
