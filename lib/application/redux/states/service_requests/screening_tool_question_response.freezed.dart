// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tool_question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningToolQuestionResponses _$ScreeningToolQuestionResponsesFromJson(
    Map<String, dynamic> json) {
  return _ScreeningToolQuestionResponses.fromJson(json);
}

/// @nodoc
mixin _$ScreeningToolQuestionResponses {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'screeningToolID')
  String? get screeningToolId => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilityID')
  String? get facilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientID')
  String? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionResponses')
  List<QuestionResponse>? get questionResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolQuestionResponsesCopyWith<ScreeningToolQuestionResponses>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolQuestionResponsesCopyWith<$Res> {
  factory $ScreeningToolQuestionResponsesCopyWith(
          ScreeningToolQuestionResponses value,
          $Res Function(ScreeningToolQuestionResponses) then) =
      _$ScreeningToolQuestionResponsesCopyWithImpl<$Res,
          ScreeningToolQuestionResponses>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'screeningToolID')
          String? screeningToolId,
      @JsonKey(name: 'facilityID')
          String? facilityId,
      @JsonKey(name: 'clientID')
          String? clientId,
      @JsonKey(name: 'questionResponses')
          List<QuestionResponse>? questionResponses});
}

/// @nodoc
class _$ScreeningToolQuestionResponsesCopyWithImpl<$Res,
        $Val extends ScreeningToolQuestionResponses>
    implements $ScreeningToolQuestionResponsesCopyWith<$Res> {
  _$ScreeningToolQuestionResponsesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screeningToolId = freezed,
    Object? facilityId = freezed,
    Object? clientId = freezed,
    Object? questionResponses = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningToolId: freezed == screeningToolId
          ? _value.screeningToolId
          : screeningToolId // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionResponses: freezed == questionResponses
          ? _value.questionResponses
          : questionResponses // ignore: cast_nullable_to_non_nullable
              as List<QuestionResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreeningToolQuestionResponsesCopyWith<$Res>
    implements $ScreeningToolQuestionResponsesCopyWith<$Res> {
  factory _$$_ScreeningToolQuestionResponsesCopyWith(
          _$_ScreeningToolQuestionResponses value,
          $Res Function(_$_ScreeningToolQuestionResponses) then) =
      __$$_ScreeningToolQuestionResponsesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'screeningToolID')
          String? screeningToolId,
      @JsonKey(name: 'facilityID')
          String? facilityId,
      @JsonKey(name: 'clientID')
          String? clientId,
      @JsonKey(name: 'questionResponses')
          List<QuestionResponse>? questionResponses});
}

/// @nodoc
class __$$_ScreeningToolQuestionResponsesCopyWithImpl<$Res>
    extends _$ScreeningToolQuestionResponsesCopyWithImpl<$Res,
        _$_ScreeningToolQuestionResponses>
    implements _$$_ScreeningToolQuestionResponsesCopyWith<$Res> {
  __$$_ScreeningToolQuestionResponsesCopyWithImpl(
      _$_ScreeningToolQuestionResponses _value,
      $Res Function(_$_ScreeningToolQuestionResponses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screeningToolId = freezed,
    Object? facilityId = freezed,
    Object? clientId = freezed,
    Object? questionResponses = freezed,
  }) {
    return _then(_$_ScreeningToolQuestionResponses(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningToolId: freezed == screeningToolId
          ? _value.screeningToolId
          : screeningToolId // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionResponses: freezed == questionResponses
          ? _value.questionResponses
          : questionResponses // ignore: cast_nullable_to_non_nullable
              as List<QuestionResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningToolQuestionResponses
    implements _ScreeningToolQuestionResponses {
  _$_ScreeningToolQuestionResponses(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'screeningToolID') this.screeningToolId,
      @JsonKey(name: 'facilityID') this.facilityId,
      @JsonKey(name: 'clientID') this.clientId,
      @JsonKey(name: 'questionResponses') this.questionResponses});

  factory _$_ScreeningToolQuestionResponses.fromJson(
          Map<String, dynamic> json) =>
      _$$_ScreeningToolQuestionResponsesFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'screeningToolID')
  final String? screeningToolId;
  @override
  @JsonKey(name: 'facilityID')
  final String? facilityId;
  @override
  @JsonKey(name: 'clientID')
  final String? clientId;
  @override
  @JsonKey(name: 'questionResponses')
  final List<QuestionResponse>? questionResponses;

  @override
  String toString() {
    return 'ScreeningToolQuestionResponses(id: $id, screeningToolId: $screeningToolId, facilityId: $facilityId, clientId: $clientId, questionResponses: $questionResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningToolQuestionResponses &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.screeningToolId, screeningToolId) ||
                other.screeningToolId == screeningToolId) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            const DeepCollectionEquality()
                .equals(other.questionResponses, questionResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, screeningToolId, facilityId,
      clientId, const DeepCollectionEquality().hash(questionResponses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningToolQuestionResponsesCopyWith<_$_ScreeningToolQuestionResponses>
      get copyWith => __$$_ScreeningToolQuestionResponsesCopyWithImpl<
          _$_ScreeningToolQuestionResponses>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolQuestionResponsesToJson(
      this,
    );
  }
}

abstract class _ScreeningToolQuestionResponses
    implements ScreeningToolQuestionResponses {
  factory _ScreeningToolQuestionResponses(
          {@JsonKey(name: 'id')
              final String? id,
          @JsonKey(name: 'screeningToolID')
              final String? screeningToolId,
          @JsonKey(name: 'facilityID')
              final String? facilityId,
          @JsonKey(name: 'clientID')
              final String? clientId,
          @JsonKey(name: 'questionResponses')
              final List<QuestionResponse>? questionResponses}) =
      _$_ScreeningToolQuestionResponses;

  factory _ScreeningToolQuestionResponses.fromJson(Map<String, dynamic> json) =
      _$_ScreeningToolQuestionResponses.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'screeningToolID')
  String? get screeningToolId;
  @override
  @JsonKey(name: 'facilityID')
  String? get facilityId;
  @override
  @JsonKey(name: 'clientID')
  String? get clientId;
  @override
  @JsonKey(name: 'questionResponses')
  List<QuestionResponse>? get questionResponses;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolQuestionResponsesCopyWith<_$_ScreeningToolQuestionResponses>
      get copyWith => throw _privateConstructorUsedError;
}
