import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'explore_book_state.freezed.dart';

@unfreezed
class ExploreBookState with _$ExploreBookState {
  factory ExploreBookState({
    @Default(null) List? categories,
    @Default(true) bool isLoading,
    @Default(false) bool isClicked,
  }) = _ExploreBookState;
}
