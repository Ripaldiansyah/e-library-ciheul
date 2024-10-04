// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/admin/admin_menu/controller/admin_menu_controller.dart' as _i549;
import 'module/admin/detail_book/controller/detail_book_controller.dart'
    as _i279;
import 'module/admin/edit_book/controller/edit_book_controller.dart' as _i539;
import 'module/admin/upload_book/controller/upload_book_controller.dart'
    as _i518;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/intro/controller/intro_controller.dart' as _i1033;
import 'module/splash/controller/splash_controller.dart' as _i827;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i549.AdminMenuController>(() => _i549.AdminMenuController());
    gh.singleton<_i279.DetailBookController>(
        () => _i279.DetailBookController());
    gh.singleton<_i539.EditBookController>(() => _i539.EditBookController());
    gh.singleton<_i518.UploadBookController>(
        () => _i518.UploadBookController());
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i1033.IntroController>(() => _i1033.IntroController());
    gh.singleton<_i827.SplashController>(() => _i827.SplashController());
    return this;
  }
}
