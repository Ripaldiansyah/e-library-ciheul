// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchBookState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchBookStateCopyWith<SearchBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBookStateCopyWith<$Res> {
  factory $SearchBookStateCopyWith(
          SearchBookState value, $Res Function(SearchBookState) then) =
      _$SearchBookStateCopyWithImpl<$Res, SearchBookState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$SearchBookStateCopyWithImpl<$Res, $Val extends SearchBookState>
    implements $SearchBookStateCopyWith<$Res> {
  _$SearchBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchBookState
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
abstract class _$$SearchBookStateImplCopyWith<$Res>
    implements $SearchBookStateCopyWith<$Res> {
  factory _$$SearchBookStateImplCopyWith(_$SearchBookStateImpl value,
          $Res Function(_$SearchBookStateImpl) then) =
      __$$SearchBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$SearchBookStateImplCopyWithImpl<$Res>
    extends _$SearchBookStateCopyWithImpl<$Res, _$SearchBookStateImpl>
    implements _$$SearchBookStateImplCopyWith<$Res> {
  __$$SearchBookStateImplCopyWithImpl(
      _$SearchBookStateImpl _value, $Res Function(_$SearchBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$SearchBookStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchBookStateImpl implements _SearchBookState {
  _$SearchBookStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'SearchBookState(counter: $counter)';
  }

  /// Create a copy of SearchBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBookStateImplCopyWith<_$SearchBookStateImpl> get copyWith =>
      __$$SearchBookStateImplCopyWithImpl<_$SearchBookStateImpl>(
          this, _$identity);
}

abstract class _SearchBookState implements SearchBookState {
  factory _SearchBookState({int counter}) = _$SearchBookStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of SearchBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchBookStateImplCopyWith<_$SearchBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
