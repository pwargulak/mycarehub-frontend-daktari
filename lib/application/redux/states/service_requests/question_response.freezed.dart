// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) {
  return _QuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$QuestionResponse {
  @JsonKey(name: 'questionType')
  QuestionType? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectMultiple')
  bool? get selectMultiple => throw _privateConstructorUsedError;
  @JsonKey(name: 'responseValueType')
  String? get responseValueType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequence')
  int? get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionText')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'normalizedResponse')
  Map<String, dynamic>? get normalizedResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionResponseCopyWith<QuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResponseCopyWith<$Res> {
  factory $QuestionResponseCopyWith(
          QuestionResponse value, $Res Function(QuestionResponse) then) =
      _$QuestionResponseCopyWithImpl<$Res, QuestionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'questionType')
          QuestionType? questionType,
      @JsonKey(name: 'selectMultiple')
          bool? selectMultiple,
      @JsonKey(name: 'responseValueType')
          String? responseValueType,
      @JsonKey(name: 'sequence')
          int? sequence,
      @JsonKey(name: 'questionText')
          String? questionText,
      @JsonKey(name: 'normalizedResponse')
          Map<String, dynamic>? normalizedResponse});
}

/// @nodoc
class _$QuestionResponseCopyWithImpl<$Res, $Val extends QuestionResponse>
    implements $QuestionResponseCopyWith<$Res> {
  _$QuestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = freezed,
    Object? selectMultiple = freezed,
    Object? responseValueType = freezed,
    Object? sequence = freezed,
    Object? questionText = freezed,
    Object? normalizedResponse = freezed,
  }) {
    return _then(_value.copyWith(
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      selectMultiple: freezed == selectMultiple
          ? _value.selectMultiple
          : selectMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseValueType: freezed == responseValueType
          ? _value.responseValueType
          : responseValueType // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      normalizedResponse: freezed == normalizedResponse
          ? _value.normalizedResponse
          : normalizedResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionResponseCopyWith<$Res>
    implements $QuestionResponseCopyWith<$Res> {
  factory _$$_QuestionResponseCopyWith(
          _$_QuestionResponse value, $Res Function(_$_QuestionResponse) then) =
      __$$_QuestionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'questionType')
          QuestionType? questionType,
      @JsonKey(name: 'selectMultiple')
          bool? selectMultiple,
      @JsonKey(name: 'responseValueType')
          String? responseValueType,
      @JsonKey(name: 'sequence')
          int? sequence,
      @JsonKey(name: 'questionText')
          String? questionText,
      @JsonKey(name: 'normalizedResponse')
          Map<String, dynamic>? normalizedResponse});
}

/// @nodoc
class __$$_QuestionResponseCopyWithImpl<$Res>
    extends _$QuestionResponseCopyWithImpl<$Res, _$_QuestionResponse>
    implements _$$_QuestionResponseCopyWith<$Res> {
  __$$_QuestionResponseCopyWithImpl(
      _$_QuestionResponse _value, $Res Function(_$_QuestionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = freezed,
    Object? selectMultiple = freezed,
    Object? responseValueType = freezed,
    Object? sequence = freezed,
    Object? questionText = freezed,
    Object? normalizedResponse = freezed,
  }) {
    return _then(_$_QuestionResponse(
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      selectMultiple: freezed == selectMultiple
          ? _value.selectMultiple
          : selectMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseValueType: freezed == responseValueType
          ? _value.responseValueType
          : responseValueType // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      normalizedResponse: freezed == normalizedResponse
          ? _value._normalizedResponse
          : normalizedResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionResponse implements _QuestionResponse {
  _$_QuestionResponse(
      {@JsonKey(name: 'questionType')
          this.questionType,
      @JsonKey(name: 'selectMultiple')
          this.selectMultiple,
      @JsonKey(name: 'responseValueType')
          this.responseValueType,
      @JsonKey(name: 'sequence')
          this.sequence,
      @JsonKey(name: 'questionText')
          this.questionText,
      @JsonKey(name: 'normalizedResponse')
          final Map<String, dynamic>? normalizedResponse})
      : _normalizedResponse = normalizedResponse;

  factory _$_QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionResponseFromJson(json);

  @override
  @JsonKey(name: 'questionType')
  final QuestionType? questionType;
  @override
  @JsonKey(name: 'selectMultiple')
  final bool? selectMultiple;
  @override
  @JsonKey(name: 'responseValueType')
  final String? responseValueType;
  @override
  @JsonKey(name: 'sequence')
  final int? sequence;
  @override
  @JsonKey(name: 'questionText')
  final String? questionText;
  final Map<String, dynamic>? _normalizedResponse;
  @override
  @JsonKey(name: 'normalizedResponse')
  Map<String, dynamic>? get normalizedResponse {
    final value = _normalizedResponse;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'QuestionResponse(questionType: $questionType, selectMultiple: $selectMultiple, responseValueType: $responseValueType, sequence: $sequence, questionText: $questionText, normalizedResponse: $normalizedResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionResponse &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.selectMultiple, selectMultiple) ||
                other.selectMultiple == selectMultiple) &&
            (identical(other.responseValueType, responseValueType) ||
                other.responseValueType == responseValueType) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            const DeepCollectionEquality()
                .equals(other._normalizedResponse, _normalizedResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionType,
      selectMultiple,
      responseValueType,
      sequence,
      questionText,
      const DeepCollectionEquality().hash(_normalizedResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionResponseCopyWith<_$_QuestionResponse> get copyWith =>
      __$$_QuestionResponseCopyWithImpl<_$_QuestionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionResponseToJson(
      this,
    );
  }
}

abstract class _QuestionResponse implements QuestionResponse {
  factory _QuestionResponse(
          {@JsonKey(name: 'questionType')
              final QuestionType? questionType,
          @JsonKey(name: 'selectMultiple')
              final bool? selectMultiple,
          @JsonKey(name: 'responseValueType')
              final String? responseValueType,
          @JsonKey(name: 'sequence')
              final int? sequence,
          @JsonKey(name: 'questionText')
              final String? questionText,
          @JsonKey(name: 'normalizedResponse')
              final Map<String, dynamic>? normalizedResponse}) =
      _$_QuestionResponse;

  factory _QuestionResponse.fromJson(Map<String, dynamic> json) =
      _$_QuestionResponse.fromJson;

  @override
  @JsonKey(name: 'questionType')
  QuestionType? get questionType;
  @override
  @JsonKey(name: 'selectMultiple')
  bool? get selectMultiple;
  @override
  @JsonKey(name: 'responseValueType')
  String? get responseValueType;
  @override
  @JsonKey(name: 'sequence')
  int? get sequence;
  @override
  @JsonKey(name: 'questionText')
  String? get questionText;
  @override
  @JsonKey(name: 'normalizedResponse')
  Map<String, dynamic>? get normalizedResponse;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionResponseCopyWith<_$_QuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
