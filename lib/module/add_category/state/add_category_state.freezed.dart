// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCategoryState {
  String? get pathCover => throw _privateConstructorUsedError;
  set pathCover(String? value) => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCategoryStateCopyWith<AddCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryStateCopyWith<$Res> {
  factory $AddCategoryStateCopyWith(
          AddCategoryState value, $Res Function(AddCategoryState) then) =
      _$AddCategoryStateCopyWithImpl<$Res, AddCategoryState>;
  @useResult
  $Res call({String? pathCover, String? label});
}

/// @nodoc
class _$AddCategoryStateCopyWithImpl<$Res, $Val extends AddCategoryState>
    implements $AddCategoryStateCopyWith<$Res> {
  _$AddCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathCover = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      pathCover: freezed == pathCover
          ? _value.pathCover
          : pathCover // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCategoryStateImplCopyWith<$Res>
    implements $AddCategoryStateCopyWith<$Res> {
  factory _$$AddCategoryStateImplCopyWith(_$AddCategoryStateImpl value,
          $Res Function(_$AddCategoryStateImpl) then) =
      __$$AddCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? pathCover, String? label});
}

/// @nodoc
class __$$AddCategoryStateImplCopyWithImpl<$Res>
    extends _$AddCategoryStateCopyWithImpl<$Res, _$AddCategoryStateImpl>
    implements _$$AddCategoryStateImplCopyWith<$Res> {
  __$$AddCategoryStateImplCopyWithImpl(_$AddCategoryStateImpl _value,
      $Res Function(_$AddCategoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathCover = freezed,
    Object? label = freezed,
  }) {
    return _then(_$AddCategoryStateImpl(
      pathCover: freezed == pathCover
          ? _value.pathCover
          : pathCover // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddCategoryStateImpl implements _AddCategoryState {
  _$AddCategoryStateImpl({this.pathCover = null, this.label = null});

  @override
  @JsonKey()
  String? pathCover;
  @override
  @JsonKey()
  String? label;

  @override
  String toString() {
    return 'AddCategoryState(pathCover: $pathCover, label: $label)';
  }

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      __$$AddCategoryStateImplCopyWithImpl<_$AddCategoryStateImpl>(
          this, _$identity);
}

abstract class _AddCategoryState implements AddCategoryState {
  factory _AddCategoryState({String? pathCover, String? label}) =
      _$AddCategoryStateImpl;

  @override
  String? get pathCover;
  set pathCover(String? value);
  @override
  String? get label;
  set label(String? value);

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
