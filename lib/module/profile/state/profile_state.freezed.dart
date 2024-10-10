// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  int get totalFavorite => throw _privateConstructorUsedError;
  set totalFavorite(int value) => throw _privateConstructorUsedError;
  int get totalMyBook => throw _privateConstructorUsedError;
  set totalMyBook(int value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({int totalFavorite, int totalMyBook, bool isLoading});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFavorite = null,
    Object? totalMyBook = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      totalFavorite: null == totalFavorite
          ? _value.totalFavorite
          : totalFavorite // ignore: cast_nullable_to_non_nullable
              as int,
      totalMyBook: null == totalMyBook
          ? _value.totalMyBook
          : totalMyBook // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalFavorite, int totalMyBook, bool isLoading});
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFavorite = null,
    Object? totalMyBook = null,
    Object? isLoading = null,
  }) {
    return _then(_$ProfileStateImpl(
      totalFavorite: null == totalFavorite
          ? _value.totalFavorite
          : totalFavorite // ignore: cast_nullable_to_non_nullable
              as int,
      totalMyBook: null == totalMyBook
          ? _value.totalMyBook
          : totalMyBook // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  _$ProfileStateImpl(
      {this.totalFavorite = 0, this.totalMyBook = 0, this.isLoading = true});

  @override
  @JsonKey()
  int totalFavorite;
  @override
  @JsonKey()
  int totalMyBook;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'ProfileState(totalFavorite: $totalFavorite, totalMyBook: $totalMyBook, isLoading: $isLoading)';
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  factory _ProfileState({int totalFavorite, int totalMyBook, bool isLoading}) =
      _$ProfileStateImpl;

  @override
  int get totalFavorite;
  set totalFavorite(int value);
  @override
  int get totalMyBook;
  set totalMyBook(int value);
  @override
  bool get isLoading;
  set isLoading(bool value);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
