import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:e_library_ciheul/database/app_database.dart';

import '../../models/user_model.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<List<User>> getAllUsers() => select(users).get();
  Future<bool> login(String email, String password) async {
    final user = await (select(users)..where((tbl) => tbl.email.equals(email)))
        .getSingleOrNull();

    if (user != null && BCrypt.checkpw(password, user.password)) {
      return true;
    } else {
      throw Exception('Invalid email or password');
    }
  }

  Future<bool> isRegistered(String email) async {
    final user = await (select(users)..where((tbl) => tbl.email.equals(email)))
        .getSingleOrNull();

    if (user != null) {
      return true;
    }
    return false;
  }

  Future insertUser(Insertable<User> user) async {
    try {
      await transaction(() async {
        await into(this.users).insert(user);
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
