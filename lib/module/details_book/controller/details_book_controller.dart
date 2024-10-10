import 'package:drift/drift.dart';
import 'package:e_library_ciheul/daos/favorites/favorites_dao.dart';
import 'package:e_library_ciheul/shared/util/db_service/db_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/details_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DetailsBookController extends Cubit<DetailsBookState>
    implements IBlocBase {
  DetailsBookController() : super(DetailsBookState());

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

  editBook() {
    Get.to(EditBookView());
  }

  deleteBook(id) async {
    try {
      final db = await DatabaseHelper().database;
      final booksDao = BooksDao(db);
      await booksDao.deleteBook(id);
      snackbarSuccess(message: "Book successfully deleted");
      Get.back();
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  checkFavorite(id) async {
    try {
      final db = await DatabaseHelper().database;
      final favoriteDao = FavoritesDao(db);
      final isFavorite = await favoriteDao.checkFavorite(id);
      emit(state.copyWith(isFavorite: isFavorite, isLoading: false));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  handleFavorite(id) async {
    final db = await DatabaseHelper().database;
    final favoriteDao = FavoritesDao(db);
    try {
      if (state.isFavorite) {
        emit(state.copyWith(isFavorite: false));
        return await favoriteDao.deleteFavorite(id);
      }
      emit(state.copyWith(isFavorite: true));
      return await favoriteDao.addToFavorite(FavoriteModelCompanion(
        bookId: Value(id),
        userId: Value(int.parse(DBService.get("userId")!)),
      ));
    } catch (e) {}
  }
}
