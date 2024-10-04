
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_book_state.freezed.dart';

@unfreezed
class EditBookState with _$EditBookState {
  factory EditBookState({
    @Default(0) int counter,
  }) = _EditBookState;
}
    
    