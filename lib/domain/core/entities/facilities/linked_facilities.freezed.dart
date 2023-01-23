// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'linked_facilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkedFacilities _$LinkedFacilitiesFromJson(Map<String, dynamic> json) {
  return _LinkedFacilities.fromJson(json);
}

/// @nodoc
mixin _$LinkedFacilities {
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkedFacilitiesCopyWith<LinkedFacilities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkedFacilitiesCopyWith<$Res> {
  factory $LinkedFacilitiesCopyWith(
          LinkedFacilities value, $Res Function(LinkedFacilities) then) =
      _$LinkedFacilitiesCopyWithImpl<$Res, LinkedFacilities>;
  @useResult
  $Res call({@JsonKey(name: 'facilities') List<Facility>? facilities});
}

/// @nodoc
class _$LinkedFacilitiesCopyWithImpl<$Res, $Val extends LinkedFacilities>
    implements $LinkedFacilitiesCopyWith<$Res> {
  _$LinkedFacilitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_value.copyWith(
      facilities: freezed == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinkedFacilitiesCopyWith<$Res>
    implements $LinkedFacilitiesCopyWith<$Res> {
  factory _$$_LinkedFacilitiesCopyWith(
          _$_LinkedFacilities value, $Res Function(_$_LinkedFacilities) then) =
      __$$_LinkedFacilitiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'facilities') List<Facility>? facilities});
}

/// @nodoc
class __$$_LinkedFacilitiesCopyWithImpl<$Res>
    extends _$LinkedFacilitiesCopyWithImpl<$Res, _$_LinkedFacilities>
    implements _$$_LinkedFacilitiesCopyWith<$Res> {
  __$$_LinkedFacilitiesCopyWithImpl(
      _$_LinkedFacilities _value, $Res Function(_$_LinkedFacilities) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_$_LinkedFacilities(
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinkedFacilities implements _LinkedFacilities {
  _$_LinkedFacilities(
      {@JsonKey(name: 'facilities') final List<Facility>? facilities})
      : _facilities = facilities;

  factory _$_LinkedFacilities.fromJson(Map<String, dynamic> json) =>
      _$$_LinkedFacilitiesFromJson(json);

  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LinkedFacilities(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkedFacilities &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkedFacilitiesCopyWith<_$_LinkedFacilities> get copyWith =>
      __$$_LinkedFacilitiesCopyWithImpl<_$_LinkedFacilities>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkedFacilitiesToJson(
      this,
    );
  }
}

abstract class _LinkedFacilities implements LinkedFacilities {
  factory _LinkedFacilities(
          {@JsonKey(name: 'facilities') final List<Facility>? facilities}) =
      _$_LinkedFacilities;

  factory _LinkedFacilities.fromJson(Map<String, dynamic> json) =
      _$_LinkedFacilities.fromJson;

  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$$_LinkedFacilitiesCopyWith<_$_LinkedFacilities> get copyWith =>
      throw _privateConstructorUsedError;
}
