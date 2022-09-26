// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_caregiver_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchCaregiverResponseState _$SearchCaregiverResponseStateFromJson(
    Map<String, dynamic> json) {
  return _SearchCaregiverResponseState.fromJson(json);
}

/// @nodoc
mixin _$SearchCaregiverResponseState {
  @JsonKey(name: 'searchCaregiverUser')
  List<Caregiver?>? get caregivers => throw _privateConstructorUsedError;
  bool? get errorFetchingCaregivers => throw _privateConstructorUsedError;
  bool? get noCaregiversFound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCaregiverResponseStateCopyWith<SearchCaregiverResponseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCaregiverResponseStateCopyWith<$Res> {
  factory $SearchCaregiverResponseStateCopyWith(
          SearchCaregiverResponseState value,
          $Res Function(SearchCaregiverResponseState) then) =
      _$SearchCaregiverResponseStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'searchCaregiverUser') List<Caregiver?>? caregivers,
      bool? errorFetchingCaregivers,
      bool? noCaregiversFound});
}

/// @nodoc
class _$SearchCaregiverResponseStateCopyWithImpl<$Res>
    implements $SearchCaregiverResponseStateCopyWith<$Res> {
  _$SearchCaregiverResponseStateCopyWithImpl(this._value, this._then);

  final SearchCaregiverResponseState _value;
  // ignore: unused_field
  final $Res Function(SearchCaregiverResponseState) _then;

  @override
  $Res call({
    Object? caregivers = freezed,
    Object? errorFetchingCaregivers = freezed,
    Object? noCaregiversFound = freezed,
  }) {
    return _then(_value.copyWith(
      caregivers: caregivers == freezed
          ? _value.caregivers
          : caregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
      errorFetchingCaregivers: errorFetchingCaregivers == freezed
          ? _value.errorFetchingCaregivers
          : errorFetchingCaregivers // ignore: cast_nullable_to_non_nullable
              as bool?,
      noCaregiversFound: noCaregiversFound == freezed
          ? _value.noCaregiversFound
          : noCaregiversFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchCaregiverResponseStateCopyWith<$Res>
    implements $SearchCaregiverResponseStateCopyWith<$Res> {
  factory _$$_SearchCaregiverResponseStateCopyWith(
          _$_SearchCaregiverResponseState value,
          $Res Function(_$_SearchCaregiverResponseState) then) =
      __$$_SearchCaregiverResponseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'searchCaregiverUser') List<Caregiver?>? caregivers,
      bool? errorFetchingCaregivers,
      bool? noCaregiversFound});
}

/// @nodoc
class __$$_SearchCaregiverResponseStateCopyWithImpl<$Res>
    extends _$SearchCaregiverResponseStateCopyWithImpl<$Res>
    implements _$$_SearchCaregiverResponseStateCopyWith<$Res> {
  __$$_SearchCaregiverResponseStateCopyWithImpl(
      _$_SearchCaregiverResponseState _value,
      $Res Function(_$_SearchCaregiverResponseState) _then)
      : super(_value, (v) => _then(v as _$_SearchCaregiverResponseState));

  @override
  _$_SearchCaregiverResponseState get _value =>
      super._value as _$_SearchCaregiverResponseState;

  @override
  $Res call({
    Object? caregivers = freezed,
    Object? errorFetchingCaregivers = freezed,
    Object? noCaregiversFound = freezed,
  }) {
    return _then(_$_SearchCaregiverResponseState(
      caregivers: caregivers == freezed
          ? _value._caregivers
          : caregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
      errorFetchingCaregivers: errorFetchingCaregivers == freezed
          ? _value.errorFetchingCaregivers
          : errorFetchingCaregivers // ignore: cast_nullable_to_non_nullable
              as bool?,
      noCaregiversFound: noCaregiversFound == freezed
          ? _value.noCaregiversFound
          : noCaregiversFound // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchCaregiverResponseState implements _SearchCaregiverResponseState {
  _$_SearchCaregiverResponseState(
      {@JsonKey(name: 'searchCaregiverUser') final List<Caregiver?>? caregivers,
      this.errorFetchingCaregivers,
      this.noCaregiversFound})
      : _caregivers = caregivers;

  factory _$_SearchCaregiverResponseState.fromJson(Map<String, dynamic> json) =>
      _$$_SearchCaregiverResponseStateFromJson(json);

  final List<Caregiver?>? _caregivers;
  @override
  @JsonKey(name: 'searchCaregiverUser')
  List<Caregiver?>? get caregivers {
    final value = _caregivers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? errorFetchingCaregivers;
  @override
  final bool? noCaregiversFound;

  @override
  String toString() {
    return 'SearchCaregiverResponseState(caregivers: $caregivers, errorFetchingCaregivers: $errorFetchingCaregivers, noCaregiversFound: $noCaregiversFound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCaregiverResponseState &&
            const DeepCollectionEquality()
                .equals(other._caregivers, _caregivers) &&
            const DeepCollectionEquality().equals(
                other.errorFetchingCaregivers, errorFetchingCaregivers) &&
            const DeepCollectionEquality()
                .equals(other.noCaregiversFound, noCaregiversFound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_caregivers),
      const DeepCollectionEquality().hash(errorFetchingCaregivers),
      const DeepCollectionEquality().hash(noCaregiversFound));

  @JsonKey(ignore: true)
  @override
  _$$_SearchCaregiverResponseStateCopyWith<_$_SearchCaregiverResponseState>
      get copyWith => __$$_SearchCaregiverResponseStateCopyWithImpl<
          _$_SearchCaregiverResponseState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchCaregiverResponseStateToJson(
      this,
    );
  }
}

abstract class _SearchCaregiverResponseState
    implements SearchCaregiverResponseState {
  factory _SearchCaregiverResponseState(
      {@JsonKey(name: 'searchCaregiverUser') final List<Caregiver?>? caregivers,
      final bool? errorFetchingCaregivers,
      final bool? noCaregiversFound}) = _$_SearchCaregiverResponseState;

  factory _SearchCaregiverResponseState.fromJson(Map<String, dynamic> json) =
      _$_SearchCaregiverResponseState.fromJson;

  @override
  @JsonKey(name: 'searchCaregiverUser')
  List<Caregiver?>? get caregivers;
  @override
  bool? get errorFetchingCaregivers;
  @override
  bool? get noCaregiversFound;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCaregiverResponseStateCopyWith<_$_SearchCaregiverResponseState>
      get copyWith => throw _privateConstructorUsedError;
}
