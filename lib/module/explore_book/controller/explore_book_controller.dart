import 'package:e_library_ciheul/daos/categories/categories_dao.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/explore_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ExploreBookController extends Cubit<ExploreBookState>
    implements IBlocBase {
  ExploreBookController() : super(ExploreBookState());

  @override
  void initState() {
    //initState event
    getGategories();
    state.isClicked = false;
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {}

  getGategories() async {
    try {
      final db = await DatabaseHelper().database;
      final categoriesDao = CategoriesDao(db);
      final categories = await categoriesDao.getAllCategories();
      emit(state.copyWith(categories: categories, isLoading: false));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  clicked() {
    emit(state.copyWith(
      isClicked: !state.isClicked,
    ));
  }

  uploadBook() {
    Get.to(UploadBookView());
  }
}
