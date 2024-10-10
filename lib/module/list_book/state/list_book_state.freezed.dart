// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListBookState {
  List<dynamic>? get filteredBookByCategory =>
      throw _privateConstructorUsedError;
  set filteredBookByCategory(List<dynamic>? value) =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of ListBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListBookStateCopyWith<ListBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListBookStateCopyWith<$Res> {
  factory $ListBookStateCopyWith(
          ListBookState value, $Res Function(ListBookState) then) =
      _$ListBookStateCopyWithImpl<$Res, ListBookState>;
  @useResult
  $Res call({List<dynamic>? filteredBookByCategory, bool isLoading});
}

/// @nodoc
class _$ListBookStateCopyWithImpl<$Res, $Val extends ListBookState>
    implements $ListBookStateCopyWith<$Res> {
  _$ListBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredBookByCategory = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      filteredBookByCategory: freezed == filteredBookByCategory
          ? _value.filteredBookByCategory
          : filteredBookByCategory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListBookStateImplCopyWith<$Res>
    implements $ListBookStateCopyWith<$Res> {
  factory _$$ListBookStateImplCopyWith(
          _$ListBookStateImpl value, $Res Function(_$ListBookStateImpl) then) =
      __$$ListBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? filteredBookByCategory, bool isLoading});
}

/// @nodoc
class __$$ListBookStateImplCopyWithImpl<$Res>
    extends _$ListBookStateCopyWithImpl<$Res, _$ListBookStateImpl>
    implements _$$ListBookStateImplCopyWith<$Res> {
  __$$ListBookStateImplCopyWithImpl(
      _$ListBookStateImpl _value, $Res Function(_$ListBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredBookByCategory = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$ListBookStateImpl(
      filteredBookByCategory: freezed == filteredBookByCategory
          ? _value.filteredBookByCategory
          : filteredBookByCategory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ListBookStateImpl implements _ListBookState {
  _$ListBookStateImpl(
      {this.filteredBookByCategory = null, this.isLoading = true});

  @override
  @JsonKey()
  List<dynamic>? filteredBookByCategory;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'ListBookState(filteredBookByCategory: $filteredBookByCategory, isLoading: $isLoading)';
  }

  /// Create a copy of ListBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListBookStateImplCopyWith<_$ListBookStateImpl> get copyWith =>
      __$$ListBookStateImplCopyWithImpl<_$ListBookStateImpl>(this, _$identity);
}

abstract class _ListBookState implements ListBookState {
  factory _ListBookState(
      {List<dynamic>? filteredBookByCategory,
      bool isLoading}) = _$ListBookStateImpl;

  @override
  List<dynamic>? get filteredBookByCategory;
  set filteredBookByCategory(List<dynamic>? value);
  @override
  bool get isLoading;
  set isLoading(bool value);

  /// Create a copy of ListBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListBookStateImplCopyWith<_$ListBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
