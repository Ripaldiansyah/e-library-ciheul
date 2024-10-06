import 'package:e_library_ciheul/database/app_database.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static AppDatabase? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<AppDatabase> get database async {
    if (_database != null) return _database!;
    // Jika belum ada, buat instance baru
    _database = await constructDb();
    return _database!;
  }
}
