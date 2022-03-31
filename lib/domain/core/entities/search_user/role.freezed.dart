// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
class _$RoleTearOff {
  const _$RoleTearOff();

  _Role call(
      {@JsonKey(name: 'roleID') String? roleID,
      @JsonKey(name: 'name') String? name}) {
    return _Role(
      roleID: roleID,
      name: name,
    );
  }

  Role fromJson(Map<String, Object?> json) {
    return Role.fromJson(json);
  }
}

/// @nodoc
const $Role = _$RoleTearOff();

/// @nodoc
mixin _$Role {
  @JsonKey(name: 'roleID')
  String? get roleID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'roleID') String? roleID,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res> implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  final Role _value;
  // ignore: unused_field
  final $Res Function(Role) _then;

  @override
  $Res call({
    Object? roleID = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      roleID: roleID == freezed
          ? _value.roleID
          : roleID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$RoleCopyWith(_Role value, $Res Function(_Role) then) =
      __$RoleCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'roleID') String? roleID,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$RoleCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res>
    implements _$RoleCopyWith<$Res> {
  __$RoleCopyWithImpl(_Role _value, $Res Function(_Role) _then)
      : super(_value, (v) => _then(v as _Role));

  @override
  _Role get _value => super._value as _Role;

  @override
  $Res call({
    Object? roleID = freezed,
    Object? name = freezed,
  }) {
    return _then(_Role(
      roleID: roleID == freezed
          ? _value.roleID
          : roleID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Role implements _Role {
  _$_Role(
      {@JsonKey(name: 'roleID') this.roleID, @JsonKey(name: 'name') this.name});

  factory _$_Role.fromJson(Map<String, dynamic> json) => _$$_RoleFromJson(json);

  @override
  @JsonKey(name: 'roleID')
  final String? roleID;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'Role(roleID: $roleID, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Role &&
            const DeepCollectionEquality().equals(other.roleID, roleID) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(roleID),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$RoleCopyWith<_Role> get copyWith =>
      __$RoleCopyWithImpl<_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleToJson(this);
  }
}

abstract class _Role implements Role {
  factory _Role(
      {@JsonKey(name: 'roleID') String? roleID,
      @JsonKey(name: 'name') String? name}) = _$_Role;

  factory _Role.fromJson(Map<String, dynamic> json) = _$_Role.fromJson;

  @override
  @JsonKey(name: 'roleID')
  String? get roleID;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$RoleCopyWith<_Role> get copyWith => throw _privateConstructorUsedError;
}