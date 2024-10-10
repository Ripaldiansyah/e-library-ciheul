import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_book_state.freezed.dart';

@unfreezed
class FavoriteBookState with _$FavoriteBookState {
  factory FavoriteBookState({
    @Default(null) List<dynamic>? books,
    @Default(true) bool isLoading,
  }) = _FavoriteBookState;
}
