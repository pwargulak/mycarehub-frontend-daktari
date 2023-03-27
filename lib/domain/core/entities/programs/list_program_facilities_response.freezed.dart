// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_program_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListProgramFacilitiesResponse _$ListProgramFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _ListProgramFacilitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$ListProgramFacilitiesResponse {
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get programFacilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListProgramFacilitiesResponseCopyWith<ListProgramFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListProgramFacilitiesResponseCopyWith<$Res> {
  factory $ListProgramFacilitiesResponseCopyWith(
          ListProgramFacilitiesResponse value,
          $Res Function(ListProgramFacilitiesResponse) then) =
      _$ListProgramFacilitiesResponseCopyWithImpl<$Res,
          ListProgramFacilitiesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getProgramFacilities')
          List<Facility>? programFacilities});
}

/// @nodoc
class _$ListProgramFacilitiesResponseCopyWithImpl<$Res,
        $Val extends ListProgramFacilitiesResponse>
    implements $ListProgramFacilitiesResponseCopyWith<$Res> {
  _$ListProgramFacilitiesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programFacilities = freezed,
  }) {
    return _then(_value.copyWith(
      programFacilities: freezed == programFacilities
          ? _value.programFacilities
          : programFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListProgramFacilitiesResponseCopyWith<$Res>
    implements $ListProgramFacilitiesResponseCopyWith<$Res> {
  factory _$$_ListProgramFacilitiesResponseCopyWith(
          _$_ListProgramFacilitiesResponse value,
          $Res Function(_$_ListProgramFacilitiesResponse) then) =
      __$$_ListProgramFacilitiesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getProgramFacilities')
          List<Facility>? programFacilities});
}

/// @nodoc
class __$$_ListProgramFacilitiesResponseCopyWithImpl<$Res>
    extends _$ListProgramFacilitiesResponseCopyWithImpl<$Res,
        _$_ListProgramFacilitiesResponse>
    implements _$$_ListProgramFacilitiesResponseCopyWith<$Res> {
  __$$_ListProgramFacilitiesResponseCopyWithImpl(
      _$_ListProgramFacilitiesResponse _value,
      $Res Function(_$_ListProgramFacilitiesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programFacilities = freezed,
  }) {
    return _then(_$_ListProgramFacilitiesResponse(
      programFacilities: freezed == programFacilities
          ? _value._programFacilities
          : programFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListProgramFacilitiesResponse
    implements _ListProgramFacilitiesResponse {
  _$_ListProgramFacilitiesResponse(
      {@JsonKey(name: 'getProgramFacilities')
          final List<Facility>? programFacilities})
      : _programFacilities = programFacilities;

  factory _$_ListProgramFacilitiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ListProgramFacilitiesResponseFromJson(json);

  final List<Facility>? _programFacilities;
  @override
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get programFacilities {
    final value = _programFacilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListProgramFacilitiesResponse(programFacilities: $programFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListProgramFacilitiesResponse &&
            const DeepCollectionEquality()
                .equals(other._programFacilities, _programFacilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_programFacilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListProgramFacilitiesResponseCopyWith<_$_ListProgramFacilitiesResponse>
      get copyWith => __$$_ListProgramFacilitiesResponseCopyWithImpl<
          _$_ListProgramFacilitiesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListProgramFacilitiesResponseToJson(
      this,
    );
  }
}

abstract class _ListProgramFacilitiesResponse
    implements ListProgramFacilitiesResponse {
  factory _ListProgramFacilitiesResponse(
          {@JsonKey(name: 'getProgramFacilities')
              final List<Facility>? programFacilities}) =
      _$_ListProgramFacilitiesResponse;

  factory _ListProgramFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_ListProgramFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'getProgramFacilities')
  List<Facility>? get programFacilities;
  @override
  @JsonKey(ignore: true)
  _$$_ListProgramFacilitiesResponseCopyWith<_$_ListProgramFacilitiesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
