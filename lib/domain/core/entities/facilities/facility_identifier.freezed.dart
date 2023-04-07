// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facility_identifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityIdentifier _$FacilityIdentifierFromJson(Map<String, dynamic> json) {
  return _FacilityIdentifier.fromJson(json);
}

/// @nodoc
mixin _$FacilityIdentifier {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityIdentifierCopyWith<FacilityIdentifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityIdentifierCopyWith<$Res> {
  factory $FacilityIdentifierCopyWith(
          FacilityIdentifier value, $Res Function(FacilityIdentifier) then) =
      _$FacilityIdentifierCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$FacilityIdentifierCopyWithImpl<$Res>
    implements $FacilityIdentifierCopyWith<$Res> {
  _$FacilityIdentifierCopyWithImpl(this._value, this._then);

  final FacilityIdentifier _value;
  // ignore: unused_field
  final $Res Function(FacilityIdentifier) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FacilityIdentifierCopyWith<$Res>
    implements $FacilityIdentifierCopyWith<$Res> {
  factory _$$_FacilityIdentifierCopyWith(_$_FacilityIdentifier value,
          $Res Function(_$_FacilityIdentifier) then) =
      __$$_FacilityIdentifierCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$$_FacilityIdentifierCopyWithImpl<$Res>
    extends _$FacilityIdentifierCopyWithImpl<$Res>
    implements _$$_FacilityIdentifierCopyWith<$Res> {
  __$$_FacilityIdentifierCopyWithImpl(
      _$_FacilityIdentifier _value, $Res Function(_$_FacilityIdentifier) _then)
      : super(_value, (v) => _then(v as _$_FacilityIdentifier));

  @override
  _$_FacilityIdentifier get _value => super._value as _$_FacilityIdentifier;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_FacilityIdentifier(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityIdentifier implements _FacilityIdentifier {
  _$_FacilityIdentifier(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'value') this.value,
      @JsonKey(name: 'type') this.type});

  factory _$_FacilityIdentifier.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityIdentifierFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'value')
  final String? value;
  @override
  @JsonKey(name: 'type')
  final String? type;

  @override
  String toString() {
    return 'FacilityIdentifier(id: $id, value: $value, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityIdentifier &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_FacilityIdentifierCopyWith<_$_FacilityIdentifier> get copyWith =>
      __$$_FacilityIdentifierCopyWithImpl<_$_FacilityIdentifier>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityIdentifierToJson(
      this,
    );
  }
}

abstract class _FacilityIdentifier implements FacilityIdentifier {
  factory _FacilityIdentifier(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'value') final String? value,
      @JsonKey(name: 'type') final String? type}) = _$_FacilityIdentifier;

  factory _FacilityIdentifier.fromJson(Map<String, dynamic> json) =
      _$_FacilityIdentifier.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'value')
  String? get value;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityIdentifierCopyWith<_$_FacilityIdentifier> get copyWith =>
      throw _privateConstructorUsedError;
}
