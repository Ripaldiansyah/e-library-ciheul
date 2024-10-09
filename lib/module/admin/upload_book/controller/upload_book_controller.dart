import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../../../../daos/categories/categories_dao.dart';
import '../state/upload_book_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class UploadBookController extends Cubit<UploadBookState> implements IBlocBase {
  UploadBookController() : super(UploadBookState());

  @override
  void initState() async {
    getGategories();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  getGategories() async {
    try {
      final db = await DatabaseHelper().database;
      final categoriesDao = CategoriesDao(db);
      final categories = await categoriesDao.getCategoryLabels();
      emit(state.copyWith(categories: categories, isLoading: false));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  uploadBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file.path);
    } else {}
  }
}
