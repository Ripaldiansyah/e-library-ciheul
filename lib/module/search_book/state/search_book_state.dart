import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
part 'search_book_state.freezed.dart';

@unfreezed
class SearchBookState with _$SearchBookState {
  factory SearchBookState({
    @Default(null) String? textTyped,
    @Default(null) List<dynamic>? books,
  }) = _SearchBookState;
}
