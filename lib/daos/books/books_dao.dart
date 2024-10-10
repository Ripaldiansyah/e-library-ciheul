import 'package:drift/drift.dart';
import 'package:e_library_ciheul/core.dart';
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

  Future<List<Books>> getBooksById(id) async {
    try {
      final books =
          await (select(booksModel)..where((tbl) => tbl.id.equals(id))).get();
      return books;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future countMyBook() async {
    try {
      final books = await (select(booksModel)
            ..where((tbl) => tbl.upload_by.equals(DBService.get("userId")!)))
          .get();
      return books.length;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Books>> searchBook(String title) async {
    try {
      final books = await (select(booksModel)
            ..where(
                (tbl) => tbl.title.lower().like('%${title.toLowerCase()}%')))
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

  Future updateBook(Insertable<Books> book) async {
    try {
      await transaction(() async {
        await update(this.booksModel).replace(book);
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
