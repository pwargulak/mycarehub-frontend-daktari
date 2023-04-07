// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'caregivers_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaregiversList _$CaregiversListFromJson(Map<String, dynamic> json) {
  return _CaregiversList.fromJson(json);
}

/// @nodoc
mixin _$CaregiversList {
  @JsonKey(name: 'caregivers')
  List<Caregiver?>? get caregivers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaregiversListCopyWith<CaregiversList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaregiversListCopyWith<$Res> {
  factory $CaregiversListCopyWith(
          CaregiversList value, $Res Function(CaregiversList) then) =
      _$CaregiversListCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'caregivers') List<Caregiver?>? caregivers});
}

/// @nodoc
class _$CaregiversListCopyWithImpl<$Res>
    implements $CaregiversListCopyWith<$Res> {
  _$CaregiversListCopyWithImpl(this._value, this._then);

  final CaregiversList _value;
  // ignore: unused_field
  final $Res Function(CaregiversList) _then;

  @override
  $Res call({
    Object? caregivers = freezed,
  }) {
    return _then(_value.copyWith(
      caregivers: caregivers == freezed
          ? _value.caregivers
          : caregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CaregiversListCopyWith<$Res>
    implements $CaregiversListCopyWith<$Res> {
  factory _$$_CaregiversListCopyWith(
          _$_CaregiversList value, $Res Function(_$_CaregiversList) then) =
      __$$_CaregiversListCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'caregivers') List<Caregiver?>? caregivers});
}

/// @nodoc
class __$$_CaregiversListCopyWithImpl<$Res>
    extends _$CaregiversListCopyWithImpl<$Res>
    implements _$$_CaregiversListCopyWith<$Res> {
  __$$_CaregiversListCopyWithImpl(
      _$_CaregiversList _value, $Res Function(_$_CaregiversList) _then)
      : super(_value, (v) => _then(v as _$_CaregiversList));

  @override
  _$_CaregiversList get _value => super._value as _$_CaregiversList;

  @override
  $Res call({
    Object? caregivers = freezed,
  }) {
    return _then(_$_CaregiversList(
      caregivers: caregivers == freezed
          ? _value._caregivers
          : caregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaregiversList implements _CaregiversList {
  _$_CaregiversList(
      {@JsonKey(name: 'caregivers') final List<Caregiver?>? caregivers})
      : _caregivers = caregivers;

  factory _$_CaregiversList.fromJson(Map<String, dynamic> json) =>
      _$$_CaregiversListFromJson(json);

  final List<Caregiver?>? _caregivers;
  @override
  @JsonKey(name: 'caregivers')
  List<Caregiver?>? get caregivers {
    final value = _caregivers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CaregiversList(caregivers: $caregivers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CaregiversList &&
            const DeepCollectionEquality()
                .equals(other._caregivers, _caregivers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_caregivers));

  @JsonKey(ignore: true)
  @override
  _$$_CaregiversListCopyWith<_$_CaregiversList> get copyWith =>
      __$$_CaregiversListCopyWithImpl<_$_CaregiversList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaregiversListToJson(
      this,
    );
  }
}

abstract class _CaregiversList implements CaregiversList {
  factory _CaregiversList(
          {@JsonKey(name: 'caregivers') final List<Caregiver?>? caregivers}) =
      _$_CaregiversList;

  factory _CaregiversList.fromJson(Map<String, dynamic> json) =
      _$_CaregiversList.fromJson;

  @override
  @JsonKey(name: 'caregivers')
  List<Caregiver?>? get caregivers;
  @override
  @JsonKey(ignore: true)
  _$$_CaregiversListCopyWith<_$_CaregiversList> get copyWith =>
      throw _privateConstructorUsedError;
}
