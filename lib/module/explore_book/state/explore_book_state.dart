
import 'package:freezed_annotation/freezed_annotation.dart';
part 'explore_book_state.freezed.dart';

@unfreezed
class ExploreBookState with _$ExploreBookState {
  factory ExploreBookState({
    @Default(0) int counter,
  }) = _ExploreBookState;
}
    
    