import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_book_state.freezed.dart';

@unfreezed
class EditBookState with _$EditBookState {
  factory EditBookState({
    @Default(null) List<Map<String, dynamic>>? categories,
    @Default(true) bool isLoading,
    @Default(null) String? pathPdf,
    @Default(null) String? pathCover,
    @Default(null) String? title,
    @Default(null) String? author,
    @Default(null) int? category,
    @Default(null) String? description,
  }) = _EditBookState;
}
