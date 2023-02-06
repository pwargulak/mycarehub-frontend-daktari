// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_organisations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchOrganisationsResponse _$SearchOrganisationsResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchOrganisationsResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchOrganisationsResponse {
  @JsonKey(name: 'searchOrganisations')
  List<Organisation>? get organisations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchOrganisationsResponseCopyWith<SearchOrganisationsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchOrganisationsResponseCopyWith<$Res> {
  factory $SearchOrganisationsResponseCopyWith(
          SearchOrganisationsResponse value,
          $Res Function(SearchOrganisationsResponse) then) =
      _$SearchOrganisationsResponseCopyWithImpl<$Res,
          SearchOrganisationsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'searchOrganisations')
          List<Organisation>? organisations});
}

/// @nodoc
class _$SearchOrganisationsResponseCopyWithImpl<$Res,
        $Val extends SearchOrganisationsResponse>
    implements $SearchOrganisationsResponseCopyWith<$Res> {
  _$SearchOrganisationsResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchOrganisationsResponseCopyWith<$Res>
    implements $SearchOrganisationsResponseCopyWith<$Res> {
  factory _$$_SearchOrganisationsResponseCopyWith(
          _$_SearchOrganisationsResponse value,
          $Res Function(_$_SearchOrganisationsResponse) then) =
      __$$_SearchOrganisationsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'searchOrganisations')
          List<Organisation>? organisations});
}

/// @nodoc
class __$$_SearchOrganisationsResponseCopyWithImpl<$Res>
    extends _$SearchOrganisationsResponseCopyWithImpl<$Res,
        _$_SearchOrganisationsResponse>
    implements _$$_SearchOrganisationsResponseCopyWith<$Res> {
  __$$_SearchOrganisationsResponseCopyWithImpl(
      _$_SearchOrganisationsResponse _value,
      $Res Function(_$_SearchOrganisationsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organisations = freezed,
  }) {
    return _then(_$_SearchOrganisationsResponse(
      organisations: freezed == organisations
          ? _value._organisations
          : organisations // ignore: cast_nullable_to_non_nullable
              as List<Organisation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchOrganisationsResponse implements _SearchOrganisationsResponse {
  _$_SearchOrganisationsResponse(
      {@JsonKey(name: 'searchOrganisations')
          final List<Organisation>? organisations})
      : _organisations = organisations;

  factory _$_SearchOrganisationsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchOrganisationsResponseFromJson(json);

  final List<Organisation>? _organisations;
  @override
  @JsonKey(name: 'searchOrganisations')
  List<Organisation>? get organisations {
    final value = _organisations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchOrganisationsResponse(organisations: $organisations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchOrganisationsResponse &&
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
  _$$_SearchOrganisationsResponseCopyWith<_$_SearchOrganisationsResponse>
      get copyWith => __$$_SearchOrganisationsResponseCopyWithImpl<
          _$_SearchOrganisationsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchOrganisationsResponseToJson(
      this,
    );
  }
}

abstract class _SearchOrganisationsResponse
    implements SearchOrganisationsResponse {
  factory _SearchOrganisationsResponse(
          {@JsonKey(name: 'searchOrganisations')
              final List<Organisation>? organisations}) =
      _$_SearchOrganisationsResponse;

  factory _SearchOrganisationsResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchOrganisationsResponse.fromJson;

  @override
  @JsonKey(name: 'searchOrganisations')
  List<Organisation>? get organisations;
  @override
  @JsonKey(ignore: true)
  _$$_SearchOrganisationsResponseCopyWith<_$_SearchOrganisationsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
