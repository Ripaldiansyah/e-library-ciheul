import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:e_library_ciheul/daos/user/user_dao.dart';
import '../models/user_model.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [Users], daos: [UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(NativeDatabase db) : super(db);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => super.migration;
}

Future<AppDatabase> constructDb() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/app_database.sqlite');
  return AppDatabase(NativeDatabase(file));
}
