import 'package:drift/drift.dart';
import 'package:e_library_ciheul/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/register_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterController extends Cubit<RegisterState> implements IBlocBase {
  RegisterController() : super(RegisterState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  login() {
    Get.back();
  }

  isPasswordMatch() {
    if (state.password != state.passwordConfirm) {
      return true;
    }
    return false;
  }

  isRegistered() async {
    final db = await DatabaseHelper().database;
    final userDao = UserDao(db);
    final user = await userDao.isRegistered(state.email!);
    return await user;
  }

  register() async {
    final db = await DatabaseHelper().database;
    final userDao = UserDao(db);

    try {
      await userDao.insertUser(UsersCompanion(
        name: Value(state.fullName!),
        email: Value(state.email!),
        password: Value(hashPassword(state.password!)),
        role: Value(state.role),
      ));
      snackbarSuccess(message: "Your account has been created successfully.");
      Get.back();
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
      return;
    }
  }
}
