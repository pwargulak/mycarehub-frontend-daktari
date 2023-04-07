// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'organisation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrganisationState _$OrganisationStateFromJson(Map<String, dynamic> json) {
  return _OrganisationState.fromJson(json);
}

/// @nodoc
mixin _$OrganisationState {
  List<Organisation>? get organisations => throw _privateConstructorUsedError;
  Organisation? get selectedOrganisation => throw _privateConstructorUsedError;
  bool? get errorGettingOrganisations =>
      throw _privateConstructorUsedError; //Used when creating an organisation
  List<Map<String, dynamic>>? get programsPayload =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganisationStateCopyWith<OrganisationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationStateCopyWith<$Res> {
  factory $OrganisationStateCopyWith(
          OrganisationState value, $Res Function(OrganisationState) then) =
      _$OrganisationStateCopyWithImpl<$Res>;
  $Res call(
      {List<Organisation>? organisations,
      Organisation? selectedOrganisation,
      bool? errorGettingOrganisations,
      List<Map<String, dynamic>>? programsPayload});

  $OrganisationCopyWith<$Res>? get selectedOrganisation;
}

/// @nodoc
class _$OrganisationStateCopyWithImpl<$Res>
    implements $OrganisationStateCopyWith<$Res> {
  _$OrganisationStateCopyWithImpl(this._value, this._then);

  final OrganisationState _value;
  // ignore: unused_field
  final $Res Function(OrganisationState) _then;

  @override
  $Res call({
    Object? organisations = freezed,
    Object? selectedOrganisation = freezed,
    Object? errorGettingOrganisations = freezed,
    Object? programsPayload = freezed,
  }) {
    return _then(_value.copyWith(
      organisations: organisations == freezed
          ? _value.organisations
          : organisations // ignore: cast_nullable_to_non_nullable
              as List<Organisation>?,
      selectedOrganisation: selectedOrganisation == freezed
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      errorGettingOrganisations: errorGettingOrganisations == freezed
          ? _value.errorGettingOrganisations
          : errorGettingOrganisations // ignore: cast_nullable_to_non_nullable
              as bool?,
      programsPayload: programsPayload == freezed
          ? _value.programsPayload
          : programsPayload // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }

  @override
  $OrganisationCopyWith<$Res>? get selectedOrganisation {
    if (_value.selectedOrganisation == null) {
      return null;
    }

    return $OrganisationCopyWith<$Res>(_value.selectedOrganisation!, (value) {
      return _then(_value.copyWith(selectedOrganisation: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrganisationStateCopyWith<$Res>
    implements $OrganisationStateCopyWith<$Res> {
  factory _$$_OrganisationStateCopyWith(_$_OrganisationState value,
          $Res Function(_$_OrganisationState) then) =
      __$$_OrganisationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Organisation>? organisations,
      Organisation? selectedOrganisation,
      bool? errorGettingOrganisations,
      List<Map<String, dynamic>>? programsPayload});

  @override
  $OrganisationCopyWith<$Res>? get selectedOrganisation;
}

/// @nodoc
class __$$_OrganisationStateCopyWithImpl<$Res>
    extends _$OrganisationStateCopyWithImpl<$Res>
    implements _$$_OrganisationStateCopyWith<$Res> {
  __$$_OrganisationStateCopyWithImpl(
      _$_OrganisationState _value, $Res Function(_$_OrganisationState) _then)
      : super(_value, (v) => _then(v as _$_OrganisationState));

  @override
  _$_OrganisationState get _value => super._value as _$_OrganisationState;

  @override
  $Res call({
    Object? organisations = freezed,
    Object? selectedOrganisation = freezed,
    Object? errorGettingOrganisations = freezed,
    Object? programsPayload = freezed,
  }) {
    return _then(_$_OrganisationState(
      organisations: organisations == freezed
          ? _value.organisations
          : organisations // ignore: cast_nullable_to_non_nullable
              as List<Organisation>?,
      selectedOrganisation: selectedOrganisation == freezed
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      errorGettingOrganisations: errorGettingOrganisations == freezed
          ? _value.errorGettingOrganisations
          : errorGettingOrganisations // ignore: cast_nullable_to_non_nullable
              as bool?,
      programsPayload: programsPayload == freezed
          ? _value.programsPayload
          : programsPayload // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrganisationState implements _OrganisationState {
  _$_OrganisationState(
      {this.organisations,
      this.selectedOrganisation,
      this.errorGettingOrganisations,
      this.programsPayload});

  factory _$_OrganisationState.fromJson(Map<String, dynamic> json) =>
      _$$_OrganisationStateFromJson(json);

  @override
  final List<Organisation>? organisations;
  @override
  final Organisation? selectedOrganisation;
  @override
  final bool? errorGettingOrganisations;
//Used when creating an organisation
  @override
  final List<Map<String, dynamic>>? programsPayload;

  @override
  String toString() {
    return 'OrganisationState(organisations: $organisations, selectedOrganisation: $selectedOrganisation, errorGettingOrganisations: $errorGettingOrganisations, programsPayload: $programsPayload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganisationState &&
            const DeepCollectionEquality()
                .equals(other.organisations, organisations) &&
            const DeepCollectionEquality()
                .equals(other.selectedOrganisation, selectedOrganisation) &&
            const DeepCollectionEquality().equals(
                other.errorGettingOrganisations, errorGettingOrganisations) &&
            const DeepCollectionEquality()
                .equals(other.programsPayload, programsPayload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(organisations),
      const DeepCollectionEquality().hash(selectedOrganisation),
      const DeepCollectionEquality().hash(errorGettingOrganisations),
      const DeepCollectionEquality().hash(programsPayload));

  @JsonKey(ignore: true)
  @override
  _$$_OrganisationStateCopyWith<_$_OrganisationState> get copyWith =>
      __$$_OrganisationStateCopyWithImpl<_$_OrganisationState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganisationStateToJson(
      this,
    );
  }
}

abstract class _OrganisationState implements OrganisationState {
  factory _OrganisationState(
          {final List<Organisation>? organisations,
          final Organisation? selectedOrganisation,
          final bool? errorGettingOrganisations,
          final List<Map<String, dynamic>>? programsPayload}) =
      _$_OrganisationState;

  factory _OrganisationState.fromJson(Map<String, dynamic> json) =
      _$_OrganisationState.fromJson;

  @override
  List<Organisation>? get organisations;
  @override
  Organisation? get selectedOrganisation;
  @override
  bool? get errorGettingOrganisations;
  @override //Used when creating an organisation
  List<Map<String, dynamic>>? get programsPayload;
  @override
  @JsonKey(ignore: true)
  _$$_OrganisationStateCopyWith<_$_OrganisationState> get copyWith =>
      throw _privateConstructorUsedError;
}
