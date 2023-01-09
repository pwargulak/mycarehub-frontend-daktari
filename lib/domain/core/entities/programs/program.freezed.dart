// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Program _$ProgramFromJson(Map<String, dynamic> json) {
  return _Program.fromJson(json);
}

/// @nodoc
mixin _$Program {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'organisation')
  Organisation? get organisation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res, Program>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'organisation') Organisation? organisation});

  $OrganisationCopyWith<$Res>? get organisation;
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res, $Val extends Program>
    implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? organisation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: freezed == organisation
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganisationCopyWith<$Res>? get organisation {
    if (_value.organisation == null) {
      return null;
    }

    return $OrganisationCopyWith<$Res>(_value.organisation!, (value) {
      return _then(_value.copyWith(organisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProgramCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$_ProgramCopyWith(
          _$_Program value, $Res Function(_$_Program) then) =
      __$$_ProgramCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'organisation') Organisation? organisation});

  @override
  $OrganisationCopyWith<$Res>? get organisation;
}

/// @nodoc
class __$$_ProgramCopyWithImpl<$Res>
    extends _$ProgramCopyWithImpl<$Res, _$_Program>
    implements _$$_ProgramCopyWith<$Res> {
  __$$_ProgramCopyWithImpl(_$_Program _value, $Res Function(_$_Program) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? organisation = freezed,
  }) {
    return _then(_$_Program(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: freezed == organisation
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Program implements _Program {
  _$_Program(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'organisation') this.organisation});

  factory _$_Program.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'organisation')
  final Organisation? organisation;

  @override
  String toString() {
    return 'Program(id: $id, name: $name, active: $active, organisation: $organisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Program &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.organisation, organisation) ||
                other.organisation == organisation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, active, organisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramCopyWith<_$_Program> get copyWith =>
      __$$_ProgramCopyWithImpl<_$_Program>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramToJson(
      this,
    );
  }
}

abstract class _Program implements Program {
  factory _Program(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'active', defaultValue: false) final bool? active,
          @JsonKey(name: 'organisation') final Organisation? organisation}) =
      _$_Program;

  factory _Program.fromJson(Map<String, dynamic> json) = _$_Program.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'organisation')
  Organisation? get organisation;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramCopyWith<_$_Program> get copyWith =>
      throw _privateConstructorUsedError;
}
