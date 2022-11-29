// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_caregivers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientCaregiversResponse _$ClientCaregiversResponseFromJson(
    Map<String, dynamic> json) {
  return _ClientCaregiversResponse.fromJson(json);
}

/// @nodoc
mixin _$ClientCaregiversResponse {
  @JsonKey(name: 'listClientsCaregivers')
  CaregiversList? get caregiversList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCaregiversResponseCopyWith<ClientCaregiversResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCaregiversResponseCopyWith<$Res> {
  factory $ClientCaregiversResponseCopyWith(ClientCaregiversResponse value,
          $Res Function(ClientCaregiversResponse) then) =
      _$ClientCaregiversResponseCopyWithImpl<$Res, ClientCaregiversResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listClientsCaregivers') CaregiversList? caregiversList});

  $CaregiversListCopyWith<$Res>? get caregiversList;
}

/// @nodoc
class _$ClientCaregiversResponseCopyWithImpl<$Res,
        $Val extends ClientCaregiversResponse>
    implements $ClientCaregiversResponseCopyWith<$Res> {
  _$ClientCaregiversResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caregiversList = freezed,
  }) {
    return _then(_value.copyWith(
      caregiversList: freezed == caregiversList
          ? _value.caregiversList
          : caregiversList // ignore: cast_nullable_to_non_nullable
              as CaregiversList?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CaregiversListCopyWith<$Res>? get caregiversList {
    if (_value.caregiversList == null) {
      return null;
    }

    return $CaregiversListCopyWith<$Res>(_value.caregiversList!, (value) {
      return _then(_value.copyWith(caregiversList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClientCaregiversResponseCopyWith<$Res>
    implements $ClientCaregiversResponseCopyWith<$Res> {
  factory _$$_ClientCaregiversResponseCopyWith(
          _$_ClientCaregiversResponse value,
          $Res Function(_$_ClientCaregiversResponse) then) =
      __$$_ClientCaregiversResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listClientsCaregivers') CaregiversList? caregiversList});

  @override
  $CaregiversListCopyWith<$Res>? get caregiversList;
}

/// @nodoc
class __$$_ClientCaregiversResponseCopyWithImpl<$Res>
    extends _$ClientCaregiversResponseCopyWithImpl<$Res,
        _$_ClientCaregiversResponse>
    implements _$$_ClientCaregiversResponseCopyWith<$Res> {
  __$$_ClientCaregiversResponseCopyWithImpl(_$_ClientCaregiversResponse _value,
      $Res Function(_$_ClientCaregiversResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caregiversList = freezed,
  }) {
    return _then(_$_ClientCaregiversResponse(
      caregiversList: freezed == caregiversList
          ? _value.caregiversList
          : caregiversList // ignore: cast_nullable_to_non_nullable
              as CaregiversList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientCaregiversResponse implements _ClientCaregiversResponse {
  _$_ClientCaregiversResponse(
      {@JsonKey(name: 'listClientsCaregivers') this.caregiversList});

  factory _$_ClientCaregiversResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ClientCaregiversResponseFromJson(json);

  @override
  @JsonKey(name: 'listClientsCaregivers')
  final CaregiversList? caregiversList;

  @override
  String toString() {
    return 'ClientCaregiversResponse(caregiversList: $caregiversList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientCaregiversResponse &&
            (identical(other.caregiversList, caregiversList) ||
                other.caregiversList == caregiversList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, caregiversList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientCaregiversResponseCopyWith<_$_ClientCaregiversResponse>
      get copyWith => __$$_ClientCaregiversResponseCopyWithImpl<
          _$_ClientCaregiversResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientCaregiversResponseToJson(
      this,
    );
  }
}

abstract class _ClientCaregiversResponse implements ClientCaregiversResponse {
  factory _ClientCaregiversResponse(
      {@JsonKey(name: 'listClientsCaregivers')
          final CaregiversList? caregiversList}) = _$_ClientCaregiversResponse;

  factory _ClientCaregiversResponse.fromJson(Map<String, dynamic> json) =
      _$_ClientCaregiversResponse.fromJson;

  @override
  @JsonKey(name: 'listClientsCaregivers')
  CaregiversList? get caregiversList;
  @override
  @JsonKey(ignore: true)
  _$$_ClientCaregiversResponseCopyWith<_$_ClientCaregiversResponse>
      get copyWith => throw _privateConstructorUsedError;
}
