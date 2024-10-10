import 'dart:io';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

@singleton
class EditBookController extends Cubit<EditBookState> implements IBlocBase {
  EditBookController() : super(EditBookState());

  @override
  void initState() {}

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
      emit(state.copyWith(categories: categories));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  getGategoriesById(id) async {
    await getGategories();
    try {
      final db = await DatabaseHelper().database;
      final categoriesDao = CategoriesDao(db);
      final categories = await categoriesDao.getCategoryById(id);

      emit(state.copyWith(
        category: categories.id,
        categorySelected: categories.id.toString(),
        isLoading: false,
      ));
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  editBook() async {
    final db = await DatabaseHelper().database;
    final booksDao = BooksDao(db);

    try {
      await booksDao.updateBook(BooksModelCompanion(
        id: Value(state.id!),
        title: Value(state.title!),
        author: Value(state.author!),
        categoryId: Value(state.category!),
        coverPath: Value(state.pathCover!),
        pdfPath: Value(state.pathPdf!),
        description: Value(state.description!),
      ));
      Get.back();
      Get.back();

      snackbarSuccess(message: "Your book has been updated successfully.");
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  // state.pathCover = widget.book.coverPath;
  // state.pathPdf = widget.book.pdfPath;
  //

  uploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String fileName = basename(file.path);
      File newFile = await file.copy('${appDocDir.path}/$fileName');
      emit(state.copyWith(pathPdf: newFile.path));
    }
  }

  uploadBookCover() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String fileName = basename(file.path);
      File newFile = await file.copy('${appDocDir.path}/$fileName');
      emit(state.copyWith(pathCover: newFile.path));
    }
  }
}
