// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExploreBookState {
  List<dynamic>? get categories => throw _privateConstructorUsedError;
  set categories(List<dynamic>? value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  bool get isClicked => throw _privateConstructorUsedError;
  set isClicked(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of ExploreBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExploreBookStateCopyWith<ExploreBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreBookStateCopyWith<$Res> {
  factory $ExploreBookStateCopyWith(
          ExploreBookState value, $Res Function(ExploreBookState) then) =
      _$ExploreBookStateCopyWithImpl<$Res, ExploreBookState>;
  @useResult
  $Res call({List<dynamic>? categories, bool isLoading, bool isClicked});
}

/// @nodoc
class _$ExploreBookStateCopyWithImpl<$Res, $Val extends ExploreBookState>
    implements $ExploreBookStateCopyWith<$Res> {
  _$ExploreBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExploreBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? isLoading = null,
    Object? isClicked = null,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClicked: null == isClicked
          ? _value.isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExploreBookStateImplCopyWith<$Res>
    implements $ExploreBookStateCopyWith<$Res> {
  factory _$$ExploreBookStateImplCopyWith(_$ExploreBookStateImpl value,
          $Res Function(_$ExploreBookStateImpl) then) =
      __$$ExploreBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? categories, bool isLoading, bool isClicked});
}

/// @nodoc
class __$$ExploreBookStateImplCopyWithImpl<$Res>
    extends _$ExploreBookStateCopyWithImpl<$Res, _$ExploreBookStateImpl>
    implements _$$ExploreBookStateImplCopyWith<$Res> {
  __$$ExploreBookStateImplCopyWithImpl(_$ExploreBookStateImpl _value,
      $Res Function(_$ExploreBookStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExploreBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? isLoading = null,
    Object? isClicked = null,
  }) {
    return _then(_$ExploreBookStateImpl(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClicked: null == isClicked
          ? _value.isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExploreBookStateImpl implements _ExploreBookState {
  _$ExploreBookStateImpl(
      {this.categories = null, this.isLoading = true, this.isClicked = false});

  @override
  @JsonKey()
  List<dynamic>? categories;
  @override
  @JsonKey()
  bool isLoading;
  @override
  @JsonKey()
  bool isClicked;

  @override
  String toString() {
    return 'ExploreBookState(categories: $categories, isLoading: $isLoading, isClicked: $isClicked)';
  }

  /// Create a copy of ExploreBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreBookStateImplCopyWith<_$ExploreBookStateImpl> get copyWith =>
      __$$ExploreBookStateImplCopyWithImpl<_$ExploreBookStateImpl>(
          this, _$identity);
}

abstract class _ExploreBookState implements ExploreBookState {
  factory _ExploreBookState(
      {List<dynamic>? categories,
      bool isLoading,
      bool isClicked}) = _$ExploreBookStateImpl;

  @override
  List<dynamic>? get categories;
  set categories(List<dynamic>? value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  bool get isClicked;
  set isClicked(bool value);

  /// Create a copy of ExploreBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExploreBookStateImplCopyWith<_$ExploreBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
