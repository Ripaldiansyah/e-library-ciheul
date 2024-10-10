// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/add_category/controller/add_category_controller.dart' as _i84;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/auth/register/controller/register_controller.dart' as _i871;
import 'module/details_book/controller/details_book_controller.dart' as _i31;
import 'module/edit_book/controller/edit_book_controller.dart' as _i877;
import 'module/explore_book/controller/explore_book_controller.dart' as _i517;
import 'module/favorite_book/controller/favorite_book_controller.dart' as _i230;
import 'module/intro/controller/intro_controller.dart' as _i1033;
import 'module/list_book/controller/list_book_controller.dart' as _i1001;
import 'module/main_navigation/controller/main_navigation_controller.dart'
    as _i164;
import 'module/profile/controller/profile_controller.dart' as _i913;
import 'module/search_book/controller/search_book_controller.dart' as _i393;
import 'module/splash/controller/splash_controller.dart' as _i827;
import 'module/upload_book/controller/upload_book_controller.dart' as _i900;

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
    gh.singleton<_i84.AddCategoryController>(
        () => _i84.AddCategoryController());
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i871.RegisterController>(() => _i871.RegisterController());
    gh.singleton<_i31.DetailsBookController>(
        () => _i31.DetailsBookController());
    gh.singleton<_i877.EditBookController>(() => _i877.EditBookController());
    gh.singleton<_i517.ExploreBookController>(
        () => _i517.ExploreBookController());
    gh.singleton<_i230.FavoriteBookController>(
        () => _i230.FavoriteBookController());
    gh.singleton<_i1033.IntroController>(() => _i1033.IntroController());
    gh.singleton<_i1001.ListBookController>(() => _i1001.ListBookController());
    gh.singleton<_i164.MainNavigationController>(
        () => _i164.MainNavigationController());
    gh.singleton<_i913.ProfileController>(() => _i913.ProfileController());
    gh.singleton<_i393.SearchBookController>(
        () => _i393.SearchBookController());
    gh.singleton<_i827.SplashController>(() => _i827.SplashController());
    gh.singleton<_i900.UploadBookController>(
        () => _i900.UploadBookController());
    return this;
  }
}
