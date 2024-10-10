import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/favorite_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavoriteBookController extends Cubit<FavoriteBookState>
    implements IBlocBase {
  FavoriteBookController() : super(FavoriteBookState());

  @override
  void initState() {}

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {}

  detailBook(book) {
    Get.to(DetailsBookView(
      book: book,
    ));
  }

  getFavoriteBook() async {
    try {
      final db = await DatabaseHelper().database;
      final favoritesDao = FavoritesDao(db);
      final favoriteBooks = await favoritesDao.getFavoriteBooks();
      emit(state.copyWith(
        books: favoriteBooks,
        isLoading: false,
      ));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      print(message);
      snackbarDanger(message: message);
    }
  }
}
