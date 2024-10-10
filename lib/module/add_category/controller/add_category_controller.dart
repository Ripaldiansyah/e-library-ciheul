import 'dart:io';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/add_category_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class AddCategoryController extends Cubit<AddCategoryState>
    implements IBlocBase {
  AddCategoryController() : super(AddCategoryState());

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

  checkCategoryRegisterd() async {
    final db = await DatabaseHelper().database;
    final categoriesDao = CategoriesDao(db);
    final category = await categoriesDao.categoryIsRegistered(state.label!);

    return await category;
  }

  addCategory() async {
    final db = await DatabaseHelper().database;
    final categoriesDao = CategoriesDao(db);

    try {
      await categoriesDao.insertCategory(CategoriesCompanion(
        label: Value(state.label!),
        image: Value(state.pathCover!),
      ));
      snackbarSuccess(message: "Category has been added successfully.");
      Get.back();
    } catch (e) {
      String message = e.toString();
      message = message.replaceAll("Exception: ", "");
      snackbarDanger(message: message);
    }
  }

  uploadCover() async {
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
