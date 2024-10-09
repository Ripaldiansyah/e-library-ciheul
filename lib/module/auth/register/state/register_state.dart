import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@unfreezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(null) String? fullName,
    @Default(null) String? email,
    @Default(null) String? password,
    @Default(null) String? passwordConfirm,
    @Default("user") String role,
  }) = _RegisterState;
}
