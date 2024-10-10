import 'package:drift/drift.dart';
import 'package:e_library_ciheul/database/app_database.dart';

import '../../models/books_model.dart';
part 'books_dao.g.dart';

@DriftAccessor(tables: [BooksModel])
class BooksDao extends DatabaseAccessor<AppDatabase> with _$BooksDaoMixin {
  BooksDao(AppDatabase db) : super(db);

  Future<List<Books>> getBooksByCategoryId(id) async {
    try {
      final books = await (select(booksModel)
            ..where((tbl) => tbl.categoryId.equals(id)))
          .get();
      return books;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future insertBook(Insertable<Books> book) async {
    try {
      await transaction(() async {
        await into(this.booksModel).insert(book);
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await (delete(booksModel)..where((book) => book.id.equals(id))).go();
    } catch (e) {
      throw Exception(e);
    }
  }
}
