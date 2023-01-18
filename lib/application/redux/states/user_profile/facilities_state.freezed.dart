// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facilities_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilitiesState _$FacilitiesStateFromJson(Map<String, dynamic> json) {
  return _FacilitiesState.fromJson(json);
}

/// @nodoc
mixin _$FacilitiesState {
  List<Facility>? get programFacilities => throw _privateConstructorUsedError;
  Facility? get selectedFacility => throw _privateConstructorUsedError;
  bool? get errorGettingFacilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilitiesStateCopyWith<FacilitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesStateCopyWith<$Res> {
  factory $FacilitiesStateCopyWith(
          FacilitiesState value, $Res Function(FacilitiesState) then) =
      _$FacilitiesStateCopyWithImpl<$Res, FacilitiesState>;
  @useResult
  $Res call(
      {List<Facility>? programFacilities,
      Facility? selectedFacility,
      bool? errorGettingFacilities});

  $FacilityCopyWith<$Res>? get selectedFacility;
}

/// @nodoc
class _$FacilitiesStateCopyWithImpl<$Res, $Val extends FacilitiesState>
    implements $FacilitiesStateCopyWith<$Res> {
  _$FacilitiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programFacilities = freezed,
    Object? selectedFacility = freezed,
    Object? errorGettingFacilities = freezed,
  }) {
    return _then(_value.copyWith(
      programFacilities: freezed == programFacilities
          ? _value.programFacilities
          : programFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      selectedFacility: freezed == selectedFacility
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      errorGettingFacilities: freezed == errorGettingFacilities
          ? _value.errorGettingFacilities
          : errorGettingFacilities // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get selectedFacility {
    if (_value.selectedFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedFacility!, (value) {
      return _then(_value.copyWith(selectedFacility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilitiesStateCopyWith<$Res>
    implements $FacilitiesStateCopyWith<$Res> {
  factory _$$_FacilitiesStateCopyWith(
          _$_FacilitiesState value, $Res Function(_$_FacilitiesState) then) =
      __$$_FacilitiesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Facility>? programFacilities,
      Facility? selectedFacility,
      bool? errorGettingFacilities});

  @override
  $FacilityCopyWith<$Res>? get selectedFacility;
}

/// @nodoc
class __$$_FacilitiesStateCopyWithImpl<$Res>
    extends _$FacilitiesStateCopyWithImpl<$Res, _$_FacilitiesState>
    implements _$$_FacilitiesStateCopyWith<$Res> {
  __$$_FacilitiesStateCopyWithImpl(
      _$_FacilitiesState _value, $Res Function(_$_FacilitiesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programFacilities = freezed,
    Object? selectedFacility = freezed,
    Object? errorGettingFacilities = freezed,
  }) {
    return _then(_$_FacilitiesState(
      programFacilities: freezed == programFacilities
          ? _value._programFacilities
          : programFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      selectedFacility: freezed == selectedFacility
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      errorGettingFacilities: freezed == errorGettingFacilities
          ? _value.errorGettingFacilities
          : errorGettingFacilities // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilitiesState implements _FacilitiesState {
  _$_FacilitiesState(
      {final List<Facility>? programFacilities,
      this.selectedFacility,
      this.errorGettingFacilities})
      : _programFacilities = programFacilities;

  factory _$_FacilitiesState.fromJson(Map<String, dynamic> json) =>
      _$$_FacilitiesStateFromJson(json);

  final List<Facility>? _programFacilities;
  @override
  List<Facility>? get programFacilities {
    final value = _programFacilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Facility? selectedFacility;
  @override
  final bool? errorGettingFacilities;

  @override
  String toString() {
    return 'FacilitiesState(programFacilities: $programFacilities, selectedFacility: $selectedFacility, errorGettingFacilities: $errorGettingFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilitiesState &&
            const DeepCollectionEquality()
                .equals(other._programFacilities, _programFacilities) &&
            (identical(other.selectedFacility, selectedFacility) ||
                other.selectedFacility == selectedFacility) &&
            (identical(other.errorGettingFacilities, errorGettingFacilities) ||
                other.errorGettingFacilities == errorGettingFacilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_programFacilities),
      selectedFacility,
      errorGettingFacilities);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      __$$_FacilitiesStateCopyWithImpl<_$_FacilitiesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilitiesStateToJson(
      this,
    );
  }
}

abstract class _FacilitiesState implements FacilitiesState {
  factory _FacilitiesState(
      {final List<Facility>? programFacilities,
      final Facility? selectedFacility,
      final bool? errorGettingFacilities}) = _$_FacilitiesState;

  factory _FacilitiesState.fromJson(Map<String, dynamic> json) =
      _$_FacilitiesState.fromJson;

  @override
  List<Facility>? get programFacilities;
  @override
  Facility? get selectedFacility;
  @override
  bool? get errorGettingFacilities;
  @override
  @JsonKey(ignore: true)
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}
