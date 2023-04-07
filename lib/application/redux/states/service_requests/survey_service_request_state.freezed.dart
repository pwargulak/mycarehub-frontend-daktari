// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_service_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyServiceRequestState _$SurveyServiceRequestStateFromJson(
    Map<String, dynamic> json) {
  return _SurveyServiceRequestState.fromJson(json);
}

/// @nodoc
mixin _$SurveyServiceRequestState {
  @JsonKey(name: 'getSurveyWithServiceRequest')
  List<SurveyServiceRequestItem?>? get surveys =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'getSurveyServiceRequestUser')
  SurveyServiceRequestRespondentsState?
      get surveyServiceRequestRespondentsState =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'getSurveyResponse')
  List<SurveyResponse>? get surveyResponses =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingSurveys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyServiceRequestStateCopyWith<SurveyServiceRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyServiceRequestStateCopyWith<$Res> {
  factory $SurveyServiceRequestStateCopyWith(SurveyServiceRequestState value,
          $Res Function(SurveyServiceRequestState) then) =
      _$SurveyServiceRequestStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getSurveyWithServiceRequest')
          List<SurveyServiceRequestItem?>? surveys,
      @JsonKey(name: 'getSurveyServiceRequestUser')
          SurveyServiceRequestRespondentsState?
              surveyServiceRequestRespondentsState,
      @JsonKey(name: 'getSurveyResponse')
          List<SurveyResponse>? surveyResponses,
      bool? errorFetchingSurveys});

  $SurveyServiceRequestRespondentsStateCopyWith<$Res>?
      get surveyServiceRequestRespondentsState;
}

/// @nodoc
class _$SurveyServiceRequestStateCopyWithImpl<$Res>
    implements $SurveyServiceRequestStateCopyWith<$Res> {
  _$SurveyServiceRequestStateCopyWithImpl(this._value, this._then);

  final SurveyServiceRequestState _value;
  // ignore: unused_field
  final $Res Function(SurveyServiceRequestState) _then;

  @override
  $Res call({
    Object? surveys = freezed,
    Object? surveyServiceRequestRespondentsState = freezed,
    Object? surveyResponses = freezed,
    Object? errorFetchingSurveys = freezed,
  }) {
    return _then(_value.copyWith(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<SurveyServiceRequestItem?>?,
      surveyServiceRequestRespondentsState: surveyServiceRequestRespondentsState ==
              freezed
          ? _value.surveyServiceRequestRespondentsState
          : surveyServiceRequestRespondentsState // ignore: cast_nullable_to_non_nullable
              as SurveyServiceRequestRespondentsState?,
      surveyResponses: surveyResponses == freezed
          ? _value.surveyResponses
          : surveyResponses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponse>?,
      errorFetchingSurveys: errorFetchingSurveys == freezed
          ? _value.errorFetchingSurveys
          : errorFetchingSurveys // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $SurveyServiceRequestRespondentsStateCopyWith<$Res>?
      get surveyServiceRequestRespondentsState {
    if (_value.surveyServiceRequestRespondentsState == null) {
      return null;
    }

    return $SurveyServiceRequestRespondentsStateCopyWith<$Res>(
        _value.surveyServiceRequestRespondentsState!, (value) {
      return _then(
          _value.copyWith(surveyServiceRequestRespondentsState: value));
    });
  }
}

/// @nodoc
abstract class _$$_SurveyServiceRequestStateCopyWith<$Res>
    implements $SurveyServiceRequestStateCopyWith<$Res> {
  factory _$$_SurveyServiceRequestStateCopyWith(
          _$_SurveyServiceRequestState value,
          $Res Function(_$_SurveyServiceRequestState) then) =
      __$$_SurveyServiceRequestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getSurveyWithServiceRequest')
          List<SurveyServiceRequestItem?>? surveys,
      @JsonKey(name: 'getSurveyServiceRequestUser')
          SurveyServiceRequestRespondentsState?
              surveyServiceRequestRespondentsState,
      @JsonKey(name: 'getSurveyResponse')
          List<SurveyResponse>? surveyResponses,
      bool? errorFetchingSurveys});

  @override
  $SurveyServiceRequestRespondentsStateCopyWith<$Res>?
      get surveyServiceRequestRespondentsState;
}

/// @nodoc
class __$$_SurveyServiceRequestStateCopyWithImpl<$Res>
    extends _$SurveyServiceRequestStateCopyWithImpl<$Res>
    implements _$$_SurveyServiceRequestStateCopyWith<$Res> {
  __$$_SurveyServiceRequestStateCopyWithImpl(
      _$_SurveyServiceRequestState _value,
      $Res Function(_$_SurveyServiceRequestState) _then)
      : super(_value, (v) => _then(v as _$_SurveyServiceRequestState));

  @override
  _$_SurveyServiceRequestState get _value =>
      super._value as _$_SurveyServiceRequestState;

  @override
  $Res call({
    Object? surveys = freezed,
    Object? surveyServiceRequestRespondentsState = freezed,
    Object? surveyResponses = freezed,
    Object? errorFetchingSurveys = freezed,
  }) {
    return _then(_$_SurveyServiceRequestState(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<SurveyServiceRequestItem?>?,
      surveyServiceRequestRespondentsState: surveyServiceRequestRespondentsState ==
              freezed
          ? _value.surveyServiceRequestRespondentsState
          : surveyServiceRequestRespondentsState // ignore: cast_nullable_to_non_nullable
              as SurveyServiceRequestRespondentsState?,
      surveyResponses: surveyResponses == freezed
          ? _value.surveyResponses
          : surveyResponses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponse>?,
      errorFetchingSurveys: errorFetchingSurveys == freezed
          ? _value.errorFetchingSurveys
          : errorFetchingSurveys // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyServiceRequestState implements _SurveyServiceRequestState {
  _$_SurveyServiceRequestState(
      {@JsonKey(name: 'getSurveyWithServiceRequest')
          this.surveys,
      @JsonKey(name: 'getSurveyServiceRequestUser')
          this.surveyServiceRequestRespondentsState,
      @JsonKey(name: 'getSurveyResponse')
          this.surveyResponses,
      this.errorFetchingSurveys});

  factory _$_SurveyServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyServiceRequestStateFromJson(json);

  @override
  @JsonKey(name: 'getSurveyWithServiceRequest')
  final List<SurveyServiceRequestItem?>? surveys;
  @override
  @JsonKey(name: 'getSurveyServiceRequestUser')
  final SurveyServiceRequestRespondentsState?
      surveyServiceRequestRespondentsState;
  @override
  @JsonKey(name: 'getSurveyResponse')
  final List<SurveyResponse>? surveyResponses;
  @override
  final bool? errorFetchingSurveys;

  @override
  String toString() {
    return 'SurveyServiceRequestState(surveys: $surveys, surveyServiceRequestRespondentsState: $surveyServiceRequestRespondentsState, surveyResponses: $surveyResponses, errorFetchingSurveys: $errorFetchingSurveys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyServiceRequestState &&
            const DeepCollectionEquality().equals(other.surveys, surveys) &&
            const DeepCollectionEquality().equals(
                other.surveyServiceRequestRespondentsState,
                surveyServiceRequestRespondentsState) &&
            const DeepCollectionEquality()
                .equals(other.surveyResponses, surveyResponses) &&
            const DeepCollectionEquality()
                .equals(other.errorFetchingSurveys, errorFetchingSurveys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(surveys),
      const DeepCollectionEquality().hash(surveyServiceRequestRespondentsState),
      const DeepCollectionEquality().hash(surveyResponses),
      const DeepCollectionEquality().hash(errorFetchingSurveys));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyServiceRequestStateCopyWith<_$_SurveyServiceRequestState>
      get copyWith => __$$_SurveyServiceRequestStateCopyWithImpl<
          _$_SurveyServiceRequestState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyServiceRequestStateToJson(
      this,
    );
  }
}

abstract class _SurveyServiceRequestState implements SurveyServiceRequestState {
  factory _SurveyServiceRequestState(
      {@JsonKey(name: 'getSurveyWithServiceRequest')
          final List<SurveyServiceRequestItem?>? surveys,
      @JsonKey(name: 'getSurveyServiceRequestUser')
          final SurveyServiceRequestRespondentsState?
              surveyServiceRequestRespondentsState,
      @JsonKey(name: 'getSurveyResponse')
          final List<SurveyResponse>? surveyResponses,
      final bool? errorFetchingSurveys}) = _$_SurveyServiceRequestState;

  factory _SurveyServiceRequestState.fromJson(Map<String, dynamic> json) =
      _$_SurveyServiceRequestState.fromJson;

  @override
  @JsonKey(name: 'getSurveyWithServiceRequest')
  List<SurveyServiceRequestItem?>? get surveys;
  @override
  @JsonKey(name: 'getSurveyServiceRequestUser')
  SurveyServiceRequestRespondentsState?
      get surveyServiceRequestRespondentsState;
  @override
  @JsonKey(name: 'getSurveyResponse')
  List<SurveyResponse>? get surveyResponses;
  @override
  bool? get errorFetchingSurveys;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyServiceRequestStateCopyWith<_$_SurveyServiceRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
