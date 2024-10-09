import 'dart:io';
import 'dart:typed_data';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:e_library_ciheul/daos/categories/categories_dao.dart';
import 'package:e_library_ciheul/models/categories_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:e_library_ciheul/daos/user/user_dao.dart';
import '../models/user_model.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [Users, Categories], daos: [UserDao, CategoriesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(NativeDatabase db) : super(db);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => super.migration;
}

Future<AppDatabase> constructDb() async {
  const dbName = 'app_database.sqlite';

  await copyDatabaseIfNotExists(dbName);

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$dbName');

  return AppDatabase(NativeDatabase(file));
}

Future<void> copyDatabaseIfNotExists(String dbName) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$dbName');

  if (!await file.exists()) {
    final ByteData data = await rootBundle.load('assets/db_init/$dbName');
    final List<int> bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
  }
}
