// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accept_terms_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AcceptTermsResponse _$AcceptTermsResponseFromJson(Map<String, dynamic> json) {
  return _AcceptTermsResponse.fromJson(json);
}

/// @nodoc
mixin _$AcceptTermsResponse {
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptTermsResponseCopyWith<AcceptTermsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptTermsResponseCopyWith<$Res> {
  factory $AcceptTermsResponseCopyWith(
          AcceptTermsResponse value, $Res Function(AcceptTermsResponse) then) =
      _$AcceptTermsResponseCopyWithImpl<$Res, AcceptTermsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class _$AcceptTermsResponseCopyWithImpl<$Res, $Val extends AcceptTermsResponse>
    implements $AcceptTermsResponseCopyWith<$Res> {
  _$AcceptTermsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTerms = null,
  }) {
    return _then(_value.copyWith(
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcceptTermsResponseCopyWith<$Res>
    implements $AcceptTermsResponseCopyWith<$Res> {
  factory _$$_AcceptTermsResponseCopyWith(_$_AcceptTermsResponse value,
          $Res Function(_$_AcceptTermsResponse) then) =
      __$$_AcceptTermsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class __$$_AcceptTermsResponseCopyWithImpl<$Res>
    extends _$AcceptTermsResponseCopyWithImpl<$Res, _$_AcceptTermsResponse>
    implements _$$_AcceptTermsResponseCopyWith<$Res> {
  __$$_AcceptTermsResponseCopyWithImpl(_$_AcceptTermsResponse _value,
      $Res Function(_$_AcceptTermsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTerms = null,
  }) {
    return _then(_$_AcceptTermsResponse(
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AcceptTermsResponse implements _AcceptTermsResponse {
  _$_AcceptTermsResponse(
      {@JsonKey(name: 'acceptTerms') required this.acceptTerms});

  factory _$_AcceptTermsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AcceptTermsResponseFromJson(json);

  @override
  @JsonKey(name: 'acceptTerms')
  final bool acceptTerms;

  @override
  String toString() {
    return 'AcceptTermsResponse(acceptTerms: $acceptTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptTermsResponse &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, acceptTerms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptTermsResponseCopyWith<_$_AcceptTermsResponse> get copyWith =>
      __$$_AcceptTermsResponseCopyWithImpl<_$_AcceptTermsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcceptTermsResponseToJson(
      this,
    );
  }
}

abstract class _AcceptTermsResponse implements AcceptTermsResponse {
  factory _AcceptTermsResponse(
          {@JsonKey(name: 'acceptTerms') required final bool acceptTerms}) =
      _$_AcceptTermsResponse;

  factory _AcceptTermsResponse.fromJson(Map<String, dynamic> json) =
      _$_AcceptTermsResponse.fromJson;

  @override
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptTermsResponseCopyWith<_$_AcceptTermsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
