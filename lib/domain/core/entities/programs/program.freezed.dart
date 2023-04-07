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
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'organisation')
  Organisation? get organisation => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility')
  List<Facility?>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'organisation') Organisation? organisation,
      @JsonKey(name: 'facility') List<Facility?>? facilities});

  $OrganisationCopyWith<$Res>? get organisation;
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res> implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  final Program _value;
  // ignore: unused_field
  final $Res Function(Program) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? active = freezed,
    Object? organisation = freezed,
    Object? facilities = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: organisation == freezed
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility?>?,
    ));
  }

  @override
  $OrganisationCopyWith<$Res>? get organisation {
    if (_value.organisation == null) {
      return null;
    }

    return $OrganisationCopyWith<$Res>(_value.organisation!, (value) {
      return _then(_value.copyWith(organisation: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProgramCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$_ProgramCopyWith(
          _$_Program value, $Res Function(_$_Program) then) =
      __$$_ProgramCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'organisation') Organisation? organisation,
      @JsonKey(name: 'facility') List<Facility?>? facilities});

  @override
  $OrganisationCopyWith<$Res>? get organisation;
}

/// @nodoc
class __$$_ProgramCopyWithImpl<$Res> extends _$ProgramCopyWithImpl<$Res>
    implements _$$_ProgramCopyWith<$Res> {
  __$$_ProgramCopyWithImpl(_$_Program _value, $Res Function(_$_Program) _then)
      : super(_value, (v) => _then(v as _$_Program));

  @override
  _$_Program get _value => super._value as _$_Program;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? active = freezed,
    Object? organisation = freezed,
    Object? facilities = freezed,
  }) {
    return _then(_$_Program(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: organisation == freezed
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      facilities: facilities == freezed
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Program implements _Program {
  _$_Program(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'organisation') this.organisation,
      @JsonKey(name: 'facility') final List<Facility?>? facilities})
      : _facilities = facilities;

  factory _$_Program.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'organisation')
  final Organisation? organisation;
  final List<Facility?>? _facilities;
  @override
  @JsonKey(name: 'facility')
  List<Facility?>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Program(id: $id, name: $name, description: $description, active: $active, organisation: $organisation, facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Program &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.organisation, organisation) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(organisation),
      const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
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
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'active', defaultValue: false) final bool? active,
          @JsonKey(name: 'organisation') final Organisation? organisation,
          @JsonKey(name: 'facility') final List<Facility?>? facilities}) =
      _$_Program;

  factory _Program.fromJson(Map<String, dynamic> json) = _$_Program.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'organisation')
  Organisation? get organisation;
  @override
  @JsonKey(name: 'facility')
  List<Facility?>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramCopyWith<_$_Program> get copyWith =>
      throw _privateConstructorUsedError;
}
