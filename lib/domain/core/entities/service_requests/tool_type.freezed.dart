// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tool_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolType _$ToolTypeFromJson(Map<String, dynamic> json) {
  return _ToolType.fromJson(json);
}

/// @nodoc
mixin _$ToolType {
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolTypeCopyWith<ToolType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolTypeCopyWith<$Res> {
  factory $ToolTypeCopyWith(ToolType value, $Res Function(ToolType) then) =
      _$ToolTypeCopyWithImpl<$Res, ToolType>;
  @useResult
  $Res call({@JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class _$ToolTypeCopyWithImpl<$Res, $Val extends ToolType>
    implements $ToolTypeCopyWith<$Res> {
  _$ToolTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolType = freezed,
  }) {
    return _then(_value.copyWith(
      toolType: freezed == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToolTypeCopyWith<$Res> implements $ToolTypeCopyWith<$Res> {
  factory _$$_ToolTypeCopyWith(
          _$_ToolType value, $Res Function(_$_ToolType) then) =
      __$$_ToolTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class __$$_ToolTypeCopyWithImpl<$Res>
    extends _$ToolTypeCopyWithImpl<$Res, _$_ToolType>
    implements _$$_ToolTypeCopyWith<$Res> {
  __$$_ToolTypeCopyWithImpl(
      _$_ToolType _value, $Res Function(_$_ToolType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolType = freezed,
  }) {
    return _then(_$_ToolType(
      toolType: freezed == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolType implements _ToolType {
  _$_ToolType({@JsonKey(name: 'toolType') this.toolType});

  factory _$_ToolType.fromJson(Map<String, dynamic> json) =>
      _$$_ToolTypeFromJson(json);

  @override
  @JsonKey(name: 'toolType')
  final ScreeningToolsType? toolType;

  @override
  String toString() {
    return 'ToolType(toolType: $toolType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToolType &&
            (identical(other.toolType, toolType) ||
                other.toolType == toolType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, toolType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToolTypeCopyWith<_$_ToolType> get copyWith =>
      __$$_ToolTypeCopyWithImpl<_$_ToolType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolTypeToJson(
      this,
    );
  }
}

abstract class _ToolType implements ToolType {
  factory _ToolType(
          {@JsonKey(name: 'toolType') final ScreeningToolsType? toolType}) =
      _$_ToolType;

  factory _ToolType.fromJson(Map<String, dynamic> json) = _$_ToolType.fromJson;

  @override
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType;
  @override
  @JsonKey(ignore: true)
  _$$_ToolTypeCopyWith<_$_ToolType> get copyWith =>
      throw _privateConstructorUsedError;
}
