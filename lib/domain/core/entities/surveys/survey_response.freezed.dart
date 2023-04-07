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
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  List<String>? get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionType')
  QuestionType? get questionType => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: 'question') String? question,
      @JsonKey(name: 'answer') List<String>? answers,
      @JsonKey(name: 'questionType') QuestionType? questionType});
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
    Object? question = freezed,
    Object? answers = freezed,
    Object? questionType = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      questionType: questionType == freezed
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
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
  $Res call(
      {@JsonKey(name: 'question') String? question,
      @JsonKey(name: 'answer') List<String>? answers,
      @JsonKey(name: 'questionType') QuestionType? questionType});
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
    Object? question = freezed,
    Object? answers = freezed,
    Object? questionType = freezed,
  }) {
    return _then(_$_SurveyResponse(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      questionType: questionType == freezed
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyResponse implements _SurveyResponse {
  _$_SurveyResponse(
      {@JsonKey(name: 'question') this.question,
      @JsonKey(name: 'answer') final List<String>? answers,
      @JsonKey(name: 'questionType') this.questionType})
      : _answers = answers;

  factory _$_SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyResponseFromJson(json);

  @override
  @JsonKey(name: 'question')
  final String? question;
  final List<String>? _answers;
  @override
  @JsonKey(name: 'answer')
  List<String>? get answers {
    final value = _answers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'questionType')
  final QuestionType? questionType;

  @override
  String toString() {
    return 'SurveyResponse(question: $question, answers: $answers, questionType: $questionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyResponse &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other.questionType, questionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(questionType));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyResponseCopyWith<_$_SurveyResponse> get copyWith =>
      __$$_SurveyResponseCopyWithImpl<_$_SurveyResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyResponseToJson(
      this,
    );
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  factory _SurveyResponse(
          {@JsonKey(name: 'question') final String? question,
          @JsonKey(name: 'answer') final List<String>? answers,
          @JsonKey(name: 'questionType') final QuestionType? questionType}) =
      _$_SurveyResponse;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$_SurveyResponse.fromJson;

  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'answer')
  List<String>? get answers;
  @override
  @JsonKey(name: 'questionType')
  QuestionType? get questionType;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyResponseCopyWith<_$_SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
