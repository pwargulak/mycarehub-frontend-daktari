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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolAssessmentResponse _$ToolAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return _ToolAssessmentResponse.fromJson(json);
}

/// @nodoc
mixin _$ToolAssessmentResponse {
  @JsonKey(name: 'clientName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateAnswered')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientID')
  String? get clientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'getScreeningToolServiceRequestResponses')
  ToolAssessmentRequestResponse? get toolAssessmentRequestResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolAssessmentResponseCopyWith<ToolAssessmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolAssessmentResponseCopyWith<$Res> {
  factory $ToolAssessmentResponseCopyWith(ToolAssessmentResponse value,
          $Res Function(ToolAssessmentResponse) then) =
      _$ToolAssessmentResponseCopyWithImpl<$Res, ToolAssessmentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clientName')
          String? name,
      @JsonKey(name: 'dateAnswered')
          String? date,
      @JsonKey(name: 'clientID')
          String? clientID,
      @JsonKey(name: 'getScreeningToolServiceRequestResponses')
          ToolAssessmentRequestResponse? toolAssessmentRequestResponse});

  $ToolAssessmentRequestResponseCopyWith<$Res>?
      get toolAssessmentRequestResponse;
}

/// @nodoc
class _$ToolAssessmentResponseCopyWithImpl<$Res,
        $Val extends ToolAssessmentResponse>
    implements $ToolAssessmentResponseCopyWith<$Res> {
  _$ToolAssessmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? clientID = freezed,
    Object? toolAssessmentRequestResponse = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      toolAssessmentRequestResponse: freezed == toolAssessmentRequestResponse
          ? _value.toolAssessmentRequestResponse
          : toolAssessmentRequestResponse // ignore: cast_nullable_to_non_nullable
              as ToolAssessmentRequestResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ToolAssessmentRequestResponseCopyWith<$Res>?
      get toolAssessmentRequestResponse {
    if (_value.toolAssessmentRequestResponse == null) {
      return null;
    }

    return $ToolAssessmentRequestResponseCopyWith<$Res>(
        _value.toolAssessmentRequestResponse!, (value) {
      return _then(
          _value.copyWith(toolAssessmentRequestResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ToolAssessmentResponseCopyWith<$Res>
    implements $ToolAssessmentResponseCopyWith<$Res> {
  factory _$$_ToolAssessmentResponseCopyWith(_$_ToolAssessmentResponse value,
          $Res Function(_$_ToolAssessmentResponse) then) =
      __$$_ToolAssessmentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clientName')
          String? name,
      @JsonKey(name: 'dateAnswered')
          String? date,
      @JsonKey(name: 'clientID')
          String? clientID,
      @JsonKey(name: 'getScreeningToolServiceRequestResponses')
          ToolAssessmentRequestResponse? toolAssessmentRequestResponse});

  @override
  $ToolAssessmentRequestResponseCopyWith<$Res>?
      get toolAssessmentRequestResponse;
}

/// @nodoc
class __$$_ToolAssessmentResponseCopyWithImpl<$Res>
    extends _$ToolAssessmentResponseCopyWithImpl<$Res,
        _$_ToolAssessmentResponse>
    implements _$$_ToolAssessmentResponseCopyWith<$Res> {
  __$$_ToolAssessmentResponseCopyWithImpl(_$_ToolAssessmentResponse _value,
      $Res Function(_$_ToolAssessmentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? date = freezed,
    Object? clientID = freezed,
    Object? toolAssessmentRequestResponse = freezed,
  }) {
    return _then(_$_ToolAssessmentResponse(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      toolAssessmentRequestResponse: freezed == toolAssessmentRequestResponse
          ? _value.toolAssessmentRequestResponse
          : toolAssessmentRequestResponse // ignore: cast_nullable_to_non_nullable
              as ToolAssessmentRequestResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolAssessmentResponse implements _ToolAssessmentResponse {
  _$_ToolAssessmentResponse(
      {@JsonKey(name: 'clientName')
          this.name,
      @JsonKey(name: 'dateAnswered')
          this.date,
      @JsonKey(name: 'clientID')
          this.clientID,
      @JsonKey(name: 'getScreeningToolServiceRequestResponses')
          this.toolAssessmentRequestResponse});

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
  @JsonKey(name: 'getScreeningToolServiceRequestResponses')
  final ToolAssessmentRequestResponse? toolAssessmentRequestResponse;

  @override
  String toString() {
    return 'ToolAssessmentResponse(name: $name, date: $date, clientID: $clientID, toolAssessmentRequestResponse: $toolAssessmentRequestResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToolAssessmentResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.clientID, clientID) ||
                other.clientID == clientID) &&
            (identical(other.toolAssessmentRequestResponse,
                    toolAssessmentRequestResponse) ||
                other.toolAssessmentRequestResponse ==
                    toolAssessmentRequestResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, date, clientID, toolAssessmentRequestResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToolAssessmentResponseCopyWith<_$_ToolAssessmentResponse> get copyWith =>
      __$$_ToolAssessmentResponseCopyWithImpl<_$_ToolAssessmentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolAssessmentResponseToJson(
      this,
    );
  }
}

abstract class _ToolAssessmentResponse implements ToolAssessmentResponse {
  factory _ToolAssessmentResponse(
      {@JsonKey(name: 'clientName')
          final String? name,
      @JsonKey(name: 'dateAnswered')
          final String? date,
      @JsonKey(name: 'clientID')
          final String? clientID,
      @JsonKey(name: 'getScreeningToolServiceRequestResponses')
          final ToolAssessmentRequestResponse?
              toolAssessmentRequestResponse}) = _$_ToolAssessmentResponse;

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
  @JsonKey(name: 'getScreeningToolServiceRequestResponses')
  ToolAssessmentRequestResponse? get toolAssessmentRequestResponse;
  @override
  @JsonKey(ignore: true)
  _$$_ToolAssessmentResponseCopyWith<_$_ToolAssessmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
