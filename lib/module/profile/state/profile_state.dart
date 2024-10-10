import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@unfreezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(0) int totalFavorite,
    @Default(0) int totalMyBook,
    @Default(true) bool isLoading,
  }) = _ProfileState;
}
