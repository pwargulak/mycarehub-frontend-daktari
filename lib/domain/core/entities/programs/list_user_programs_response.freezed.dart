// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_user_programs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListUserProgramsResponse _$ListUserProgramsResponseFromJson(
    Map<String, dynamic> json) {
  return _ListUserProgramsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListUserProgramsResponse {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'programs')
  List<Program>? get userPrograms => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchPrograms')
  List<Program>? get programs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListUserProgramsResponseCopyWith<ListUserProgramsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListUserProgramsResponseCopyWith<$Res> {
  factory $ListUserProgramsResponseCopyWith(ListUserProgramsResponse value,
          $Res Function(ListUserProgramsResponse) then) =
      _$ListUserProgramsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'programs') List<Program>? userPrograms,
      @JsonKey(name: 'searchPrograms') List<Program>? programs});
}

/// @nodoc
class _$ListUserProgramsResponseCopyWithImpl<$Res>
    implements $ListUserProgramsResponseCopyWith<$Res> {
  _$ListUserProgramsResponseCopyWithImpl(this._value, this._then);

  final ListUserProgramsResponse _value;
  // ignore: unused_field
  final $Res Function(ListUserProgramsResponse) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? userPrograms = freezed,
    Object? programs = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      userPrograms: userPrograms == freezed
          ? _value.userPrograms
          : userPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      programs: programs == freezed
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListUserProgramsResponseCopyWith<$Res>
    implements $ListUserProgramsResponseCopyWith<$Res> {
  factory _$$_ListUserProgramsResponseCopyWith(
          _$_ListUserProgramsResponse value,
          $Res Function(_$_ListUserProgramsResponse) then) =
      __$$_ListUserProgramsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'programs') List<Program>? userPrograms,
      @JsonKey(name: 'searchPrograms') List<Program>? programs});
}

/// @nodoc
class __$$_ListUserProgramsResponseCopyWithImpl<$Res>
    extends _$ListUserProgramsResponseCopyWithImpl<$Res>
    implements _$$_ListUserProgramsResponseCopyWith<$Res> {
  __$$_ListUserProgramsResponseCopyWithImpl(_$_ListUserProgramsResponse _value,
      $Res Function(_$_ListUserProgramsResponse) _then)
      : super(_value, (v) => _then(v as _$_ListUserProgramsResponse));

  @override
  _$_ListUserProgramsResponse get _value =>
      super._value as _$_ListUserProgramsResponse;

  @override
  $Res call({
    Object? count = freezed,
    Object? userPrograms = freezed,
    Object? programs = freezed,
  }) {
    return _then(_$_ListUserProgramsResponse(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      userPrograms: userPrograms == freezed
          ? _value._userPrograms
          : userPrograms // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
      programs: programs == freezed
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListUserProgramsResponse implements _ListUserProgramsResponse {
  _$_ListUserProgramsResponse(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'programs') final List<Program>? userPrograms,
      @JsonKey(name: 'searchPrograms') final List<Program>? programs})
      : _userPrograms = userPrograms,
        _programs = programs;

  factory _$_ListUserProgramsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListUserProgramsResponseFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  final List<Program>? _userPrograms;
  @override
  @JsonKey(name: 'programs')
  List<Program>? get userPrograms {
    final value = _userPrograms;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Program>? _programs;
  @override
  @JsonKey(name: 'searchPrograms')
  List<Program>? get programs {
    final value = _programs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListUserProgramsResponse(count: $count, userPrograms: $userPrograms, programs: $programs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListUserProgramsResponse &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other._userPrograms, _userPrograms) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_userPrograms),
      const DeepCollectionEquality().hash(_programs));

  @JsonKey(ignore: true)
  @override
  _$$_ListUserProgramsResponseCopyWith<_$_ListUserProgramsResponse>
      get copyWith => __$$_ListUserProgramsResponseCopyWithImpl<
          _$_ListUserProgramsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListUserProgramsResponseToJson(
      this,
    );
  }
}

abstract class _ListUserProgramsResponse implements ListUserProgramsResponse {
  factory _ListUserProgramsResponse(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'programs') final List<Program>? userPrograms,
          @JsonKey(name: 'searchPrograms') final List<Program>? programs}) =
      _$_ListUserProgramsResponse;

  factory _ListUserProgramsResponse.fromJson(Map<String, dynamic> json) =
      _$_ListUserProgramsResponse.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'programs')
  List<Program>? get userPrograms;
  @override
  @JsonKey(name: 'searchPrograms')
  List<Program>? get programs;
  @override
  @JsonKey(ignore: true)
  _$$_ListUserProgramsResponseCopyWith<_$_ListUserProgramsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
