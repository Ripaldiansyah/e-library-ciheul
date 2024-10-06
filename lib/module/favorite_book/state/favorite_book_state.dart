
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_book_state.freezed.dart';

@unfreezed
class FavoriteBookState with _$FavoriteBookState {
  factory FavoriteBookState({
    @Default(0) int counter,
  }) = _FavoriteBookState;
}
    
    