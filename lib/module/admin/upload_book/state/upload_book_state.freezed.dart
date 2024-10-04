// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadBookState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of UploadBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadBookStateCopyWith<UploadBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadBookStateCopyWith<$Res> {
  factory $UploadBookStateCopyWith(
          UploadBookState value, $Res Function(UploadBookState) then) =
      _$UploadBookStateCopyWithImpl<$Res, UploadBookState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$UploadBookStateCopyWithImpl<$Res, $Val extends UploadBookState>
    implements $UploadBookStateCopyWith<$Res> {
  _$UploadBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadBookState
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
abstract class _$$UploadBookStateImplCopyWith<$Res>
    implements $UploadBookStateCopyWith<$Res> {
  factory _$$UploadBookStateImplCopyWith(_$UploadBookStateImpl value,
          $Res Function(_$UploadBookStateImpl) then) =
      __$$UploadBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$UploadBookStateImplCopyWithImpl<$Res>
    extends _$UploadBookStateCopyWithImpl<$Res, _$UploadBookStateImpl>
    implements _$$UploadBookStateImplCopyWith<$Res> {
  __$$UploadBookStateImplCopyWithImpl(
      _$UploadBookStateImpl _value, $Res Function(_$UploadBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$UploadBookStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UploadBookStateImpl implements _UploadBookState {
  _$UploadBookStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'UploadBookState(counter: $counter)';
  }

  /// Create a copy of UploadBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadBookStateImplCopyWith<_$UploadBookStateImpl> get copyWith =>
      __$$UploadBookStateImplCopyWithImpl<_$UploadBookStateImpl>(
          this, _$identity);
}

abstract class _UploadBookState implements UploadBookState {
  factory _UploadBookState({int counter}) = _$UploadBookStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of UploadBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadBookStateImplCopyWith<_$UploadBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
