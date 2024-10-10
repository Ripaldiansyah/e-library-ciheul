// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PdfViewState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of PdfViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfViewStateCopyWith<PdfViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfViewStateCopyWith<$Res> {
  factory $PdfViewStateCopyWith(
          PdfViewState value, $Res Function(PdfViewState) then) =
      _$PdfViewStateCopyWithImpl<$Res, PdfViewState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$PdfViewStateCopyWithImpl<$Res, $Val extends PdfViewState>
    implements $PdfViewStateCopyWith<$Res> {
  _$PdfViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfViewState
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
abstract class _$$PdfViewStateImplCopyWith<$Res>
    implements $PdfViewStateCopyWith<$Res> {
  factory _$$PdfViewStateImplCopyWith(
          _$PdfViewStateImpl value, $Res Function(_$PdfViewStateImpl) then) =
      __$$PdfViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$PdfViewStateImplCopyWithImpl<$Res>
    extends _$PdfViewStateCopyWithImpl<$Res, _$PdfViewStateImpl>
    implements _$$PdfViewStateImplCopyWith<$Res> {
  __$$PdfViewStateImplCopyWithImpl(
      _$PdfViewStateImpl _value, $Res Function(_$PdfViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$PdfViewStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PdfViewStateImpl implements _PdfViewState {
  _$PdfViewStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'PdfViewState(counter: $counter)';
  }

  /// Create a copy of PdfViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfViewStateImplCopyWith<_$PdfViewStateImpl> get copyWith =>
      __$$PdfViewStateImplCopyWithImpl<_$PdfViewStateImpl>(this, _$identity);
}

abstract class _PdfViewState implements PdfViewState {
  factory _PdfViewState({int counter}) = _$PdfViewStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of PdfViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfViewStateImplCopyWith<_$PdfViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
