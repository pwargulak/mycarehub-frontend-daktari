// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'age_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgeRange _$AgeRangeFromJson(Map<String, dynamic> json) {
  return _AgeRange.fromJson(json);
}

/// @nodoc
class _$AgeRangeTearOff {
  const _$AgeRangeTearOff();

  _AgeRange call(
      {@JsonKey(toJson: doubleToInt) required double lowerBound,
      @JsonKey(toJson: doubleToInt) required double upperBound}) {
    return _AgeRange(
      lowerBound: lowerBound,
      upperBound: upperBound,
    );
  }

  AgeRange fromJson(Map<String, Object> json) {
    return AgeRange.fromJson(json);
  }
}

/// @nodoc
const $AgeRange = _$AgeRangeTearOff();

/// @nodoc
mixin _$AgeRange {
  @JsonKey(toJson: doubleToInt)
  double get lowerBound => throw _privateConstructorUsedError;
  @JsonKey(toJson: doubleToInt)
  double get upperBound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgeRangeCopyWith<AgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeRangeCopyWith<$Res> {
  factory $AgeRangeCopyWith(AgeRange value, $Res Function(AgeRange) then) =
      _$AgeRangeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: doubleToInt) double lowerBound,
      @JsonKey(toJson: doubleToInt) double upperBound});
}

/// @nodoc
class _$AgeRangeCopyWithImpl<$Res> implements $AgeRangeCopyWith<$Res> {
  _$AgeRangeCopyWithImpl(this._value, this._then);

  final AgeRange _value;
  // ignore: unused_field
  final $Res Function(AgeRange) _then;

  @override
  $Res call({
    Object? lowerBound = freezed,
    Object? upperBound = freezed,
  }) {
    return _then(_value.copyWith(
      lowerBound: lowerBound == freezed
          ? _value.lowerBound
          : lowerBound // ignore: cast_nullable_to_non_nullable
              as double,
      upperBound: upperBound == freezed
          ? _value.upperBound
          : upperBound // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$AgeRangeCopyWith<$Res> implements $AgeRangeCopyWith<$Res> {
  factory _$AgeRangeCopyWith(_AgeRange value, $Res Function(_AgeRange) then) =
      __$AgeRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: doubleToInt) double lowerBound,
      @JsonKey(toJson: doubleToInt) double upperBound});
}

/// @nodoc
class __$AgeRangeCopyWithImpl<$Res> extends _$AgeRangeCopyWithImpl<$Res>
    implements _$AgeRangeCopyWith<$Res> {
  __$AgeRangeCopyWithImpl(_AgeRange _value, $Res Function(_AgeRange) _then)
      : super(_value, (v) => _then(v as _AgeRange));

  @override
  _AgeRange get _value => super._value as _AgeRange;

  @override
  $Res call({
    Object? lowerBound = freezed,
    Object? upperBound = freezed,
  }) {
    return _then(_AgeRange(
      lowerBound: lowerBound == freezed
          ? _value.lowerBound
          : lowerBound // ignore: cast_nullable_to_non_nullable
              as double,
      upperBound: upperBound == freezed
          ? _value.upperBound
          : upperBound // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AgeRange implements _AgeRange {
  _$_AgeRange(
      {@JsonKey(toJson: doubleToInt) required this.lowerBound,
      @JsonKey(toJson: doubleToInt) required this.upperBound});

  factory _$_AgeRange.fromJson(Map<String, dynamic> json) =>
      _$_$_AgeRangeFromJson(json);

  @override
  @JsonKey(toJson: doubleToInt)
  final double lowerBound;
  @override
  @JsonKey(toJson: doubleToInt)
  final double upperBound;

  @override
  String toString() {
    return 'AgeRange(lowerBound: $lowerBound, upperBound: $upperBound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgeRange &&
            (identical(other.lowerBound, lowerBound) ||
                const DeepCollectionEquality()
                    .equals(other.lowerBound, lowerBound)) &&
            (identical(other.upperBound, upperBound) ||
                const DeepCollectionEquality()
                    .equals(other.upperBound, upperBound)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lowerBound) ^
      const DeepCollectionEquality().hash(upperBound);

  @JsonKey(ignore: true)
  @override
  _$AgeRangeCopyWith<_AgeRange> get copyWith =>
      __$AgeRangeCopyWithImpl<_AgeRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AgeRangeToJson(this);
  }
}

abstract class _AgeRange implements AgeRange {
  factory _AgeRange(
      {@JsonKey(toJson: doubleToInt) required double lowerBound,
      @JsonKey(toJson: doubleToInt) required double upperBound}) = _$_AgeRange;

  factory _AgeRange.fromJson(Map<String, dynamic> json) = _$_AgeRange.fromJson;

  @override
  @JsonKey(toJson: doubleToInt)
  double get lowerBound => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: doubleToInt)
  double get upperBound => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AgeRangeCopyWith<_AgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}