// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchFacilitiesResponse _$FetchFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _FetchFacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchFacilitiesResponse {
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchFacilitiesResponseCopyWith<FetchFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchFacilitiesResponseCopyWith<$Res> {
  factory $FetchFacilitiesResponseCopyWith(FetchFacilitiesResponse value,
          $Res Function(FetchFacilitiesResponse) then) =
      _$FetchFacilitiesResponseCopyWithImpl<$Res, FetchFacilitiesResponse>;
  @useResult
  $Res call({@JsonKey(name: 'facilities') List<Facility>? facilities});
}

/// @nodoc
class _$FetchFacilitiesResponseCopyWithImpl<$Res,
        $Val extends FetchFacilitiesResponse>
    implements $FetchFacilitiesResponseCopyWith<$Res> {
  _$FetchFacilitiesResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_FetchFacilitiesResponseCopyWith<$Res>
    implements $FetchFacilitiesResponseCopyWith<$Res> {
  factory _$$_FetchFacilitiesResponseCopyWith(_$_FetchFacilitiesResponse value,
          $Res Function(_$_FetchFacilitiesResponse) then) =
      __$$_FetchFacilitiesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'facilities') List<Facility>? facilities});
}

/// @nodoc
class __$$_FetchFacilitiesResponseCopyWithImpl<$Res>
    extends _$FetchFacilitiesResponseCopyWithImpl<$Res,
        _$_FetchFacilitiesResponse>
    implements _$$_FetchFacilitiesResponseCopyWith<$Res> {
  __$$_FetchFacilitiesResponseCopyWithImpl(_$_FetchFacilitiesResponse _value,
      $Res Function(_$_FetchFacilitiesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_$_FetchFacilitiesResponse(
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchFacilitiesResponse implements _FetchFacilitiesResponse {
  _$_FetchFacilitiesResponse(
      {@JsonKey(name: 'facilities') final List<Facility>? facilities})
      : _facilities = facilities;

  factory _$_FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchFacilitiesResponseFromJson(json);

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
    return 'FetchFacilitiesResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchFacilitiesResponse &&
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
  _$$_FetchFacilitiesResponseCopyWith<_$_FetchFacilitiesResponse>
      get copyWith =>
          __$$_FetchFacilitiesResponseCopyWithImpl<_$_FetchFacilitiesResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchFacilitiesResponseToJson(
      this,
    );
  }
}

abstract class _FetchFacilitiesResponse implements FetchFacilitiesResponse {
  factory _FetchFacilitiesResponse(
          {@JsonKey(name: 'facilities') final List<Facility>? facilities}) =
      _$_FetchFacilitiesResponse;

  factory _FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$$_FetchFacilitiesResponseCopyWith<_$_FetchFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
