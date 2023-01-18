// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'program_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramFacilitiesResponse _$ProgramFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _ProgramFacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$ProgramFacilitiesResponse {
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramFacilitiesResponseCopyWith<ProgramFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramFacilitiesResponseCopyWith<$Res> {
  factory $ProgramFacilitiesResponseCopyWith(ProgramFacilitiesResponse value,
          $Res Function(ProgramFacilitiesResponse) then) =
      _$ProgramFacilitiesResponseCopyWithImpl<$Res, ProgramFacilitiesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getProgramFacilities') List<Facility>? facilities});
}

/// @nodoc
class _$ProgramFacilitiesResponseCopyWithImpl<$Res,
        $Val extends ProgramFacilitiesResponse>
    implements $ProgramFacilitiesResponseCopyWith<$Res> {
  _$ProgramFacilitiesResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_ProgramFacilitiesResponseCopyWith<$Res>
    implements $ProgramFacilitiesResponseCopyWith<$Res> {
  factory _$$_ProgramFacilitiesResponseCopyWith(
          _$_ProgramFacilitiesResponse value,
          $Res Function(_$_ProgramFacilitiesResponse) then) =
      __$$_ProgramFacilitiesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getProgramFacilities') List<Facility>? facilities});
}

/// @nodoc
class __$$_ProgramFacilitiesResponseCopyWithImpl<$Res>
    extends _$ProgramFacilitiesResponseCopyWithImpl<$Res,
        _$_ProgramFacilitiesResponse>
    implements _$$_ProgramFacilitiesResponseCopyWith<$Res> {
  __$$_ProgramFacilitiesResponseCopyWithImpl(
      _$_ProgramFacilitiesResponse _value,
      $Res Function(_$_ProgramFacilitiesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_$_ProgramFacilitiesResponse(
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramFacilitiesResponse implements _ProgramFacilitiesResponse {
  _$_ProgramFacilitiesResponse(
      {@JsonKey(name: 'getProgramFacilities') final List<Facility>? facilities})
      : _facilities = facilities;

  factory _$_ProgramFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramFacilitiesResponseFromJson(json);

  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProgramFacilitiesResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramFacilitiesResponse &&
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
  _$$_ProgramFacilitiesResponseCopyWith<_$_ProgramFacilitiesResponse>
      get copyWith => __$$_ProgramFacilitiesResponseCopyWithImpl<
          _$_ProgramFacilitiesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramFacilitiesResponseToJson(
      this,
    );
  }
}

abstract class _ProgramFacilitiesResponse implements ProgramFacilitiesResponse {
  factory _ProgramFacilitiesResponse(
      {@JsonKey(name: 'getProgramFacilities')
          final List<Facility>? facilities}) = _$_ProgramFacilitiesResponse;

  factory _ProgramFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_ProgramFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramFacilitiesResponseCopyWith<_$_ProgramFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
