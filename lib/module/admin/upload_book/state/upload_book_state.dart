
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_book_state.freezed.dart';

@unfreezed
class UploadBookState with _$UploadBookState {
  factory UploadBookState({
    @Default(0) int counter,
  }) = _UploadBookState;
}
    
    