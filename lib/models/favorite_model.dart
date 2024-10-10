import 'package:drift/drift.dart';

@DataClassName("favorites")
class FavoriteModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId =>
      integer().customConstraint('REFERENCES books_model(id)')();
  IntColumn get userId => integer().customConstraint('REFERENCES users(id)')();
}
