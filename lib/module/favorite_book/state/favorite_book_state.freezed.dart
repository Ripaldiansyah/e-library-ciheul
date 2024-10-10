// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteBookState {
  List<dynamic>? get books => throw _privateConstructorUsedError;
  set books(List<dynamic>? value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteBookStateCopyWith<FavoriteBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteBookStateCopyWith<$Res> {
  factory $FavoriteBookStateCopyWith(
          FavoriteBookState value, $Res Function(FavoriteBookState) then) =
      _$FavoriteBookStateCopyWithImpl<$Res, FavoriteBookState>;
  @useResult
  $Res call({List<dynamic>? books, bool isLoading});
}

/// @nodoc
class _$FavoriteBookStateCopyWithImpl<$Res, $Val extends FavoriteBookState>
    implements $FavoriteBookStateCopyWith<$Res> {
  _$FavoriteBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteBookStateImplCopyWith<$Res>
    implements $FavoriteBookStateCopyWith<$Res> {
  factory _$$FavoriteBookStateImplCopyWith(_$FavoriteBookStateImpl value,
          $Res Function(_$FavoriteBookStateImpl) then) =
      __$$FavoriteBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? books, bool isLoading});
}

/// @nodoc
class __$$FavoriteBookStateImplCopyWithImpl<$Res>
    extends _$FavoriteBookStateCopyWithImpl<$Res, _$FavoriteBookStateImpl>
    implements _$$FavoriteBookStateImplCopyWith<$Res> {
  __$$FavoriteBookStateImplCopyWithImpl(_$FavoriteBookStateImpl _value,
      $Res Function(_$FavoriteBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$FavoriteBookStateImpl(
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteBookStateImpl implements _FavoriteBookState {
  _$FavoriteBookStateImpl({this.books = null, this.isLoading = true});

  @override
  @JsonKey()
  List<dynamic>? books;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'FavoriteBookState(books: $books, isLoading: $isLoading)';
  }

  /// Create a copy of FavoriteBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteBookStateImplCopyWith<_$FavoriteBookStateImpl> get copyWith =>
      __$$FavoriteBookStateImplCopyWithImpl<_$FavoriteBookStateImpl>(
          this, _$identity);
}

abstract class _FavoriteBookState implements FavoriteBookState {
  factory _FavoriteBookState({List<dynamic>? books, bool isLoading}) =
      _$FavoriteBookStateImpl;

  @override
  List<dynamic>? get books;
  set books(List<dynamic>? value);
  @override
  bool get isLoading;
  set isLoading(bool value);

  /// Create a copy of FavoriteBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteBookStateImplCopyWith<_$FavoriteBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
