import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/list_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ListBookController extends Cubit<ListBookState> implements IBlocBase {
  ListBookController() : super(ListBookState());

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

  detailBook(book, Function() fetchData) {
    Get.to(DetailsBookView(
      book: book,
      fetchData: fetchData,
    ));
  }

  getBookByCategoryId(id) async {
    final db = await DatabaseHelper().database;
    final booksDao = BooksDao(db);
    try {
      final getBooksByCategoryId = await booksDao.getBooksByCategoryId(id);
      emit(state.copyWith(
        filteredBookByCategory: getBooksByCategoryId,
        isLoading: false,
      ));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }
}
