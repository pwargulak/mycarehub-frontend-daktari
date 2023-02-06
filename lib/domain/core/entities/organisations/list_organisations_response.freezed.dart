// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_organisations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListOrganisationsResponse _$ListOrganisationsResponseFromJson(
    Map<String, dynamic> json) {
  return _ListOrganisationsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListOrganisationsResponse {
  @JsonKey(name: 'organisations')
  List<Organisation>? get organisations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListOrganisationsResponseCopyWith<ListOrganisationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOrganisationsResponseCopyWith<$Res> {
  factory $ListOrganisationsResponseCopyWith(ListOrganisationsResponse value,
          $Res Function(ListOrganisationsResponse) then) =
      _$ListOrganisationsResponseCopyWithImpl<$Res, ListOrganisationsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'organisations') List<Organisation>? organisations});
}

/// @nodoc
class _$ListOrganisationsResponseCopyWithImpl<$Res,
        $Val extends ListOrganisationsResponse>
    implements $ListOrganisationsResponseCopyWith<$Res> {
  _$ListOrganisationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organisations = freezed,
  }) {
    return _then(_value.copyWith(
      organisations: freezed == organisations
          ? _value.organisations
          : organisations // ignore: cast_nullable_to_non_nullable
              as List<Organisation>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListOrganisationsResponseCopyWith<$Res>
    implements $ListOrganisationsResponseCopyWith<$Res> {
  factory _$$_ListOrganisationsResponseCopyWith(
          _$_ListOrganisationsResponse value,
          $Res Function(_$_ListOrganisationsResponse) then) =
      __$$_ListOrganisationsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'organisations') List<Organisation>? organisations});
}

/// @nodoc
class __$$_ListOrganisationsResponseCopyWithImpl<$Res>
    extends _$ListOrganisationsResponseCopyWithImpl<$Res,
        _$_ListOrganisationsResponse>
    implements _$$_ListOrganisationsResponseCopyWith<$Res> {
  __$$_ListOrganisationsResponseCopyWithImpl(
      _$_ListOrganisationsResponse _value,
      $Res Function(_$_ListOrganisationsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organisations = freezed,
  }) {
    return _then(_$_ListOrganisationsResponse(
      organisations: freezed == organisations
          ? _value._organisations
          : organisations // ignore: cast_nullable_to_non_nullable
              as List<Organisation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListOrganisationsResponse implements _ListOrganisationsResponse {
  _$_ListOrganisationsResponse(
      {@JsonKey(name: 'organisations') final List<Organisation>? organisations})
      : _organisations = organisations;

  factory _$_ListOrganisationsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListOrganisationsResponseFromJson(json);

  final List<Organisation>? _organisations;
  @override
  @JsonKey(name: 'organisations')
  List<Organisation>? get organisations {
    final value = _organisations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListOrganisationsResponse(organisations: $organisations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListOrganisationsResponse &&
            const DeepCollectionEquality()
                .equals(other._organisations, _organisations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_organisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListOrganisationsResponseCopyWith<_$_ListOrganisationsResponse>
      get copyWith => __$$_ListOrganisationsResponseCopyWithImpl<
          _$_ListOrganisationsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListOrganisationsResponseToJson(
      this,
    );
  }
}

abstract class _ListOrganisationsResponse implements ListOrganisationsResponse {
  factory _ListOrganisationsResponse(
          {@JsonKey(name: 'organisations')
              final List<Organisation>? organisations}) =
      _$_ListOrganisationsResponse;

  factory _ListOrganisationsResponse.fromJson(Map<String, dynamic> json) =
      _$_ListOrganisationsResponse.fromJson;

  @override
  @JsonKey(name: 'organisations')
  List<Organisation>? get organisations;
  @override
  @JsonKey(ignore: true)
  _$$_ListOrganisationsResponseCopyWith<_$_ListOrganisationsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
