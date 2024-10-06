import 'package:e_library_ciheul/core.dart';
import 'package:e_library_ciheul/daos/user/user_dao.dart';
import 'package:e_library_ciheul/database/app_database.dart';
import 'package:e_library_ciheul/shared/util/database_helper.dart';
import 'package:e_library_ciheul/shared/util/show_snackbar/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/login_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

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

  login() async {
    try {
      final db = await DatabaseHelper().database;

      final userDao = UserDao(db);
      final user = await userDao.login(state.email!, state.password!);
      Get.offAll(MainNavigationView());
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  register() async {
    Get.to(RegisterView());
  }
}
