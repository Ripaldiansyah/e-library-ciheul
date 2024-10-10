import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/profile_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileController extends Cubit<ProfileState> implements IBlocBase {
  ProfileController() : super(ProfileState());

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

  totalFavorite() async {
    try {
      final db = await DatabaseHelper().database;
      final favoriteDao = FavoritesDao(db);
      final totalFavorite = await favoriteDao.countFavorite();
      await totalMyBooks(totalFavorite);
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  totalMyBooks(totalFavorite) async {
    try {
      final db = await DatabaseHelper().database;
      final booksDao = BooksDao(db);
      final totalMyBook = await booksDao.countMyBook();
      emit(state.copyWith(
          totalFavorite: totalFavorite,
          totalMyBook: totalMyBook,
          isLoading: false));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  logout() {
    Get.offAll(LoginView());
    DBService.clear("userId");
    DBService.clear("name");
    DBService.clear("email");
  }
}
