import 'package:drift/drift.dart';

@DataClassName("Books")
class BooksModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  IntColumn get categoryId =>
      integer().customConstraint('REFERENCES categories(id)')();
  TextColumn get description => text()();
  TextColumn get coverPath => text()();
  TextColumn get pdfPath => text()();
}
