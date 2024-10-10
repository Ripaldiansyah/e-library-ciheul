import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_category_state.freezed.dart';

@unfreezed
class AddCategoryState with _$AddCategoryState {
  factory AddCategoryState({
    @Default(null) String? pathCover,
    @Default(null) String? label,
  }) = _AddCategoryState;
}
