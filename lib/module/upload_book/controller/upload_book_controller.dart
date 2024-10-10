import 'dart:io';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

  publish() async {
    final db = await DatabaseHelper().database;
    final booksDao = BooksDao(db);

    try {
      await booksDao.insertBook(BooksModelCompanion(
        title: Value(state.title!),
        author: Value(state.author!),
        categoryId: Value(state.category!),
        coverPath: Value(state.pathCover!),
        pdfPath: Value(state.pathPdf!),
        description: Value(state.description!),
      ));
      snackbarSuccess(message: "Your book has been published successfully.");
      Get.back();
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

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
    } else {}
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
    } else {}
  }
}
