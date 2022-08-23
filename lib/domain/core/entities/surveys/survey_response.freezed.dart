// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) {
  return _SurveyResponse.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponse {
// name of the respondent
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyResponseCopyWith<SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseCopyWith<$Res> {
  factory $SurveyResponseCopyWith(
          SurveyResponse value, $Res Function(SurveyResponse) then) =
      _$SurveyResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$SurveyResponseCopyWithImpl<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  _$SurveyResponseCopyWithImpl(this._value, this._then);

  final SurveyResponse _value;
  // ignore: unused_field
  final $Res Function(SurveyResponse) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyResponseCopyWith<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  factory _$$_SurveyResponseCopyWith(
          _$_SurveyResponse value, $Res Function(_$_SurveyResponse) then) =
      __$$_SurveyResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$_SurveyResponseCopyWithImpl<$Res>
    extends _$SurveyResponseCopyWithImpl<$Res>
    implements _$$_SurveyResponseCopyWith<$Res> {
  __$$_SurveyResponseCopyWithImpl(
      _$_SurveyResponse _value, $Res Function(_$_SurveyResponse) _then)
      : super(_value, (v) => _then(v as _$_SurveyResponse));

  @override
  _$_SurveyResponse get _value => super._value as _$_SurveyResponse;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_SurveyResponse(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyResponse implements _SurveyResponse {
  _$_SurveyResponse({@JsonKey(name: 'name') this.name});

  factory _$_SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyResponseFromJson(json);

// name of the respondent
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'SurveyResponse(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyResponse &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyResponseCopyWith<_$_SurveyResponse> get copyWith =>
      __$$_SurveyResponseCopyWithImpl<_$_SurveyResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyResponseToJson(this);
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  factory _SurveyResponse({@JsonKey(name: 'name') final String? name}) =
      _$_SurveyResponse;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$_SurveyResponse.fromJson;

  @override // name of the respondent
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyResponseCopyWith<_$_SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
