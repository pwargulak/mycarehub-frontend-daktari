// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_respondent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyRespondent _$SurveyRespondentFromJson(Map<String, dynamic> json) {
  return _SurveyRespondent.fromJson(json);
}

/// @nodoc
mixin _$SurveyRespondent {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectID')
  int? get projectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'submitterID')
  int? get submitterID => throw _privateConstructorUsedError;
  @JsonKey(name: 'formID')
  String? get formID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyRespondentCopyWith<SurveyRespondent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyRespondentCopyWith<$Res> {
  factory $SurveyRespondentCopyWith(
          SurveyRespondent value, $Res Function(SurveyRespondent) then) =
      _$SurveyRespondentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'submitterID') int? submitterID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class _$SurveyRespondentCopyWithImpl<$Res>
    implements $SurveyRespondentCopyWith<$Res> {
  _$SurveyRespondentCopyWithImpl(this._value, this._then);

  final SurveyRespondent _value;
  // ignore: unused_field
  final $Res Function(SurveyRespondent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? projectID = freezed,
    Object? submitterID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: projectID == freezed
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      submitterID: submitterID == freezed
          ? _value.submitterID
          : submitterID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: formID == freezed
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyRespondentCopyWith<$Res>
    implements $SurveyRespondentCopyWith<$Res> {
  factory _$$_SurveyRespondentCopyWith(
          _$_SurveyRespondent value, $Res Function(_$_SurveyRespondent) then) =
      __$$_SurveyRespondentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'submitterID') int? submitterID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class __$$_SurveyRespondentCopyWithImpl<$Res>
    extends _$SurveyRespondentCopyWithImpl<$Res>
    implements _$$_SurveyRespondentCopyWith<$Res> {
  __$$_SurveyRespondentCopyWithImpl(
      _$_SurveyRespondent _value, $Res Function(_$_SurveyRespondent) _then)
      : super(_value, (v) => _then(v as _$_SurveyRespondent));

  @override
  _$_SurveyRespondent get _value => super._value as _$_SurveyRespondent;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? projectID = freezed,
    Object? submitterID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_$_SurveyRespondent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: projectID == freezed
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      submitterID: submitterID == freezed
          ? _value.submitterID
          : submitterID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: formID == freezed
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyRespondent implements _SurveyRespondent {
  _$_SurveyRespondent(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'projectID') this.projectID,
      @JsonKey(name: 'submitterID') this.submitterID,
      @JsonKey(name: 'formID') this.formID});

  factory _$_SurveyRespondent.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyRespondentFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'projectID')
  final int? projectID;
  @override
  @JsonKey(name: 'submitterID')
  final int? submitterID;
  @override
  @JsonKey(name: 'formID')
  final String? formID;

  @override
  String toString() {
    return 'SurveyRespondent(id: $id, name: $name, projectID: $projectID, submitterID: $submitterID, formID: $formID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyRespondent &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.projectID, projectID) &&
            const DeepCollectionEquality()
                .equals(other.submitterID, submitterID) &&
            const DeepCollectionEquality().equals(other.formID, formID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(projectID),
      const DeepCollectionEquality().hash(submitterID),
      const DeepCollectionEquality().hash(formID));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyRespondentCopyWith<_$_SurveyRespondent> get copyWith =>
      __$$_SurveyRespondentCopyWithImpl<_$_SurveyRespondent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyRespondentToJson(this);
  }
}

abstract class _SurveyRespondent implements SurveyRespondent {
  factory _SurveyRespondent(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'projectID') final int? projectID,
      @JsonKey(name: 'submitterID') final int? submitterID,
      @JsonKey(name: 'formID') final String? formID}) = _$_SurveyRespondent;

  factory _SurveyRespondent.fromJson(Map<String, dynamic> json) =
      _$_SurveyRespondent.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'projectID')
  int? get projectID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'submitterID')
  int? get submitterID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'formID')
  String? get formID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyRespondentCopyWith<_$_SurveyRespondent> get copyWith =>
      throw _privateConstructorUsedError;
}
