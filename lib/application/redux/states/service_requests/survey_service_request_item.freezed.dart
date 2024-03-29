// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_service_request_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyServiceRequestItem _$SurveyServiceRequestItemFromJson(
    Map<String, dynamic> json) {
  return _SurveyServiceRequestItem.fromJson(json);
}

/// @nodoc
mixin _$SurveyServiceRequestItem {
  @JsonKey(name: 'projectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'formID')
  String? get xmlFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyServiceRequestItemCopyWith<SurveyServiceRequestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyServiceRequestItemCopyWith<$Res> {
  factory $SurveyServiceRequestItemCopyWith(SurveyServiceRequestItem value,
          $Res Function(SurveyServiceRequestItem) then) =
      _$SurveyServiceRequestItemCopyWithImpl<$Res, SurveyServiceRequestItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'projectID') int? projectId,
      @JsonKey(name: 'formID') String? xmlFormId,
      @JsonKey(name: 'title') String? name});
}

/// @nodoc
class _$SurveyServiceRequestItemCopyWithImpl<$Res,
        $Val extends SurveyServiceRequestItem>
    implements $SurveyServiceRequestItemCopyWith<$Res> {
  _$SurveyServiceRequestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? xmlFormId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      xmlFormId: freezed == xmlFormId
          ? _value.xmlFormId
          : xmlFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyServiceRequestItemCopyWith<$Res>
    implements $SurveyServiceRequestItemCopyWith<$Res> {
  factory _$$_SurveyServiceRequestItemCopyWith(
          _$_SurveyServiceRequestItem value,
          $Res Function(_$_SurveyServiceRequestItem) then) =
      __$$_SurveyServiceRequestItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'projectID') int? projectId,
      @JsonKey(name: 'formID') String? xmlFormId,
      @JsonKey(name: 'title') String? name});
}

/// @nodoc
class __$$_SurveyServiceRequestItemCopyWithImpl<$Res>
    extends _$SurveyServiceRequestItemCopyWithImpl<$Res,
        _$_SurveyServiceRequestItem>
    implements _$$_SurveyServiceRequestItemCopyWith<$Res> {
  __$$_SurveyServiceRequestItemCopyWithImpl(_$_SurveyServiceRequestItem _value,
      $Res Function(_$_SurveyServiceRequestItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? xmlFormId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_SurveyServiceRequestItem(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      xmlFormId: freezed == xmlFormId
          ? _value.xmlFormId
          : xmlFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyServiceRequestItem implements _SurveyServiceRequestItem {
  _$_SurveyServiceRequestItem(
      {@JsonKey(name: 'projectID') this.projectId,
      @JsonKey(name: 'formID') this.xmlFormId,
      @JsonKey(name: 'title') this.name});

  factory _$_SurveyServiceRequestItem.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyServiceRequestItemFromJson(json);

  @override
  @JsonKey(name: 'projectID')
  final int? projectId;
  @override
  @JsonKey(name: 'formID')
  final String? xmlFormId;
  @override
  @JsonKey(name: 'title')
  final String? name;

  @override
  String toString() {
    return 'SurveyServiceRequestItem(projectId: $projectId, xmlFormId: $xmlFormId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyServiceRequestItem &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.xmlFormId, xmlFormId) ||
                other.xmlFormId == xmlFormId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, xmlFormId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyServiceRequestItemCopyWith<_$_SurveyServiceRequestItem>
      get copyWith => __$$_SurveyServiceRequestItemCopyWithImpl<
          _$_SurveyServiceRequestItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyServiceRequestItemToJson(
      this,
    );
  }
}

abstract class _SurveyServiceRequestItem implements SurveyServiceRequestItem {
  factory _SurveyServiceRequestItem(
          {@JsonKey(name: 'projectID') final int? projectId,
          @JsonKey(name: 'formID') final String? xmlFormId,
          @JsonKey(name: 'title') final String? name}) =
      _$_SurveyServiceRequestItem;

  factory _SurveyServiceRequestItem.fromJson(Map<String, dynamic> json) =
      _$_SurveyServiceRequestItem.fromJson;

  @override
  @JsonKey(name: 'projectID')
  int? get projectId;
  @override
  @JsonKey(name: 'formID')
  String? get xmlFormId;
  @override
  @JsonKey(name: 'title')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyServiceRequestItemCopyWith<_$_SurveyServiceRequestItem>
      get copyWith => throw _privateConstructorUsedError;
}
