import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/search_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class SearchBookController extends Cubit<SearchBookState> implements IBlocBase {
  SearchBookController() : super(SearchBookState());

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

  detailBook(book) {
    Get.to(DetailsBookView(
      book: book,
    ));
  }

  emitType(value, books) {
    emit(state.copyWith(textTyped: value, books: books));
  }

  searchBook(title) async {
    try {
      final db = await DatabaseHelper().database;
      final booksDao = BooksDao(db);
      final books = await booksDao.searchBook(title);
      return books;
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }
}
