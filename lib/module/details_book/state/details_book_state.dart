import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_book_state.freezed.dart';

@unfreezed
class DetailsBookState with _$DetailsBookState {
  factory DetailsBookState({
    @Default(true) bool isLoading,
    @Default(false) bool isFavorite,
  }) = _DetailsBookState;
}
