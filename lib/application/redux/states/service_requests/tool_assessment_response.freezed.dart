// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tool_assessment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolAssessmentResponse _$ToolAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return _ToolAssessmentResponse.fromJson(json);
}

/// @nodoc
class _$ToolAssessmentResponseTearOff {
  const _$ToolAssessmentResponseTearOff();

  _ToolAssessmentResponse call(
      {@JsonKey(name: 'clientName') String? name,
      @JsonKey(name: 'dateAnswered') String? date,
      @JsonKey(name: 'clientID') String? clientID}) {
    return _ToolAssessmentResponse(
      name: name,
      date: date,
      clientID: clientID,
    );
  }

  ToolAssessmentResponse fromJson(Map<String, Object?> json) {
    return ToolAssessmentResponse.fromJson(json);
  }
}

/// @nodoc
const $ToolAssessmentResponse = _$ToolAssessmentResponseTearOff();

/// @nodoc
mixin _$ToolAssessmentResponse {
  @JsonKey(name: 'clientName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateAnswered')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientID')
  String? get clientID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolAssessmentResponseCopyWith<ToolAssessmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolAssessmentResponseCopyWith<$Res> {
  factory $ToolAssessmentResponseCopyWith(ToolAssessmentResponse value,
          $Res Function(ToolAssessmentResponse) then) =
      _$ToolAssessmentResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'clientName') String? name,
      @JsonKey(name: 'dateAnswered') String? date,
      @JsonKey(name: 'clientID') String? clientID});
}

/// @nodoc
class _$ToolAssessmentResponseCopyWithImpl<$Res>
    implements $ToolAssessmentResponseCopyWith<$Res> {
  _$ToolAssessmentResponseCopyWithImpl(this._value, this._then);

  final ToolAssessmentResponse _value;
  // ignore: unused_field
  final $Res Function(ToolAssessmentResponse) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? clientID = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ToolAssessmentResponseCopyWith<$Res>
    implements $ToolAssessmentResponseCopyWith<$Res> {
  factory _$ToolAssessmentResponseCopyWith(_ToolAssessmentResponse value,
          $Res Function(_ToolAssessmentResponse) then) =
      __$ToolAssessmentResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'clientName') String? name,
      @JsonKey(name: 'dateAnswered') String? date,
      @JsonKey(name: 'clientID') String? clientID});
}

/// @nodoc
class __$ToolAssessmentResponseCopyWithImpl<$Res>
    extends _$ToolAssessmentResponseCopyWithImpl<$Res>
    implements _$ToolAssessmentResponseCopyWith<$Res> {
  __$ToolAssessmentResponseCopyWithImpl(_ToolAssessmentResponse _value,
      $Res Function(_ToolAssessmentResponse) _then)
      : super(_value, (v) => _then(v as _ToolAssessmentResponse));

  @override
  _ToolAssessmentResponse get _value => super._value as _ToolAssessmentResponse;

  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? clientID = freezed,
  }) {
    return _then(_ToolAssessmentResponse(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolAssessmentResponse implements _ToolAssessmentResponse {
  _$_ToolAssessmentResponse(
      {@JsonKey(name: 'clientName') this.name,
      @JsonKey(name: 'dateAnswered') this.date,
      @JsonKey(name: 'clientID') this.clientID});

  factory _$_ToolAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ToolAssessmentResponseFromJson(json);

  @override
  @JsonKey(name: 'clientName')
  final String? name;
  @override
  @JsonKey(name: 'dateAnswered')
  final String? date;
  @override
  @JsonKey(name: 'clientID')
  final String? clientID;

  @override
  String toString() {
    return 'ToolAssessmentResponse(name: $name, date: $date, clientID: $clientID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolAssessmentResponse &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.clientID, clientID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(clientID));

  @JsonKey(ignore: true)
  @override
  _$ToolAssessmentResponseCopyWith<_ToolAssessmentResponse> get copyWith =>
      __$ToolAssessmentResponseCopyWithImpl<_ToolAssessmentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolAssessmentResponseToJson(this);
  }
}

abstract class _ToolAssessmentResponse implements ToolAssessmentResponse {
  factory _ToolAssessmentResponse(
      {@JsonKey(name: 'clientName') String? name,
      @JsonKey(name: 'dateAnswered') String? date,
      @JsonKey(name: 'clientID') String? clientID}) = _$_ToolAssessmentResponse;

  factory _ToolAssessmentResponse.fromJson(Map<String, dynamic> json) =
      _$_ToolAssessmentResponse.fromJson;

  @override
  @JsonKey(name: 'clientName')
  String? get name;
  @override
  @JsonKey(name: 'dateAnswered')
  String? get date;
  @override
  @JsonKey(name: 'clientID')
  String? get clientID;
  @override
  @JsonKey(ignore: true)
  _$ToolAssessmentResponseCopyWith<_ToolAssessmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}