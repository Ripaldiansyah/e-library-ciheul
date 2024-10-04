// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of IntroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntroStateCopyWith<IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res, IntroState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res, $Val extends IntroState>
    implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntroState
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
abstract class _$$IntroStateImplCopyWith<$Res>
    implements $IntroStateCopyWith<$Res> {
  factory _$$IntroStateImplCopyWith(
          _$IntroStateImpl value, $Res Function(_$IntroStateImpl) then) =
      __$$IntroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$IntroStateImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$IntroStateImpl>
    implements _$$IntroStateImplCopyWith<$Res> {
  __$$IntroStateImplCopyWithImpl(
      _$IntroStateImpl _value, $Res Function(_$IntroStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntroState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$IntroStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IntroStateImpl implements _IntroState {
  _$IntroStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'IntroState(counter: $counter)';
  }

  /// Create a copy of IntroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      __$$IntroStateImplCopyWithImpl<_$IntroStateImpl>(this, _$identity);
}

abstract class _IntroState implements IntroState {
  factory _IntroState({int counter}) = _$IntroStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of IntroState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
