
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_book_state.freezed.dart';

@unfreezed
class DetailBookState with _$DetailBookState {
  factory DetailBookState({
    @Default(0) int counter,
  }) = _DetailBookState;
}
    
    