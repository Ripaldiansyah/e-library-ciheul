import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:e_library_ciheul/database/app_database.dart';

import '../../models/user_model.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<List<User>> getAllUsers() => select(users).get();

  Future<void> insertUser(Insertable<User> user) => into(users).insert(user);

  Future<void> deleteUser(Insertable<User> user) => delete(users).delete(user);

  Future<bool> login(String email, String password) async {
    final user = await (select(users)..where((tbl) => tbl.email.equals(email)))
        .getSingleOrNull();

    if (user != null && BCrypt.checkpw(password, user.password)) {
      return true; // Login berhasil
    } else {
      throw Exception(
          'Invalid email or password'); // Mengeluarkan pengecualian jika login gagal
    }
  }

  Future<void> insertUsers(List<Insertable<User>> users) async {
    await transaction(() async {
      for (final user in users) {
        await into(this.users).insert(user);
      }
    });
  }
}
