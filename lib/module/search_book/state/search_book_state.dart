
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_book_state.freezed.dart';

@unfreezed
class SearchBookState with _$SearchBookState {
  factory SearchBookState({
    @Default(0) int counter,
  }) = _SearchBookState;
}
    
    