import 'package:freezed_annotation/freezed_annotation.dart';
part 'list_book_state.freezed.dart';

@unfreezed
class ListBookState with _$ListBookState {
  factory ListBookState({
    @Default(null) List? filteredBookByCategory,
    @Default(true) bool isLoading,
  }) = _ListBookState;
}
