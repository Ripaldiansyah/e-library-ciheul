// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditBookState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of EditBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditBookStateCopyWith<EditBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBookStateCopyWith<$Res> {
  factory $EditBookStateCopyWith(
          EditBookState value, $Res Function(EditBookState) then) =
      _$EditBookStateCopyWithImpl<$Res, EditBookState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$EditBookStateCopyWithImpl<$Res, $Val extends EditBookState>
    implements $EditBookStateCopyWith<$Res> {
  _$EditBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditBookStateImplCopyWith<$Res>
    implements $EditBookStateCopyWith<$Res> {
  factory _$$EditBookStateImplCopyWith(
          _$EditBookStateImpl value, $Res Function(_$EditBookStateImpl) then) =
      __$$EditBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$EditBookStateImplCopyWithImpl<$Res>
    extends _$EditBookStateCopyWithImpl<$Res, _$EditBookStateImpl>
    implements _$$EditBookStateImplCopyWith<$Res> {
  __$$EditBookStateImplCopyWithImpl(
      _$EditBookStateImpl _value, $Res Function(_$EditBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$EditBookStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditBookStateImpl implements _EditBookState {
  _$EditBookStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'EditBookState(counter: $counter)';
  }

  /// Create a copy of EditBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditBookStateImplCopyWith<_$EditBookStateImpl> get copyWith =>
      __$$EditBookStateImplCopyWithImpl<_$EditBookStateImpl>(this, _$identity);
}

abstract class _EditBookState implements EditBookState {
  factory _EditBookState({int counter}) = _$EditBookStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of EditBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditBookStateImplCopyWith<_$EditBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
