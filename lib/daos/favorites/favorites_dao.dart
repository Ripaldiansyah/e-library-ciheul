import 'package:drift/drift.dart';
import 'package:e_library_ciheul/shared/util/db_service/db_service.dart';

import '../../core.dart';
import '../../models/books_model.dart';
import '../../models/favorite_model.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [FavoriteModel, BooksModel])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(AppDatabase db) : super(db);

  Future<bool> checkFavorite(bookId) async {
    final favorite = await (select(favoriteModel)
          ..where((tbl) =>
              tbl.bookId.equals(bookId) &
              tbl.userId.equals(int.parse(DBService.get("userId")!))))
        .getSingleOrNull();

    if (favorite != null) {
      return true;
    }
    return false;
  }

  Future<List<FavoriteBook>> getFavoriteBooks() async {
    try {
      final userId = int.parse(DBService.get("userId")!);

      final result = await customSelect(
        '''
      SELECT f.id AS favorite_id, 
             f.book_id, 
             b.title, 
             b.author,
             b.cover_path,
             b.pdf_path,
             b.category_id,
             b.description
      FROM favorite_model AS f 
      INNER JOIN books_model AS b ON f.book_id = b.id 
      WHERE f.user_Id = ?
      ''',
        variables: [Variable.withInt(userId)],
        readsFrom: {favoriteModel, booksModel},
      ).get();

      return result.map((row) {
        return FavoriteBook.fromMap({
          'id': row.read<int>('book_id'),
          'bookId': row.read<int>('book_id'),
          'categoryId': row.read<int>('category_id'),
          'title': row.read<String>('title'),
          'author': row.read<String>('author'),
          'coverPath': row.read<String>('cover_path'),
          'pdfPath': row.read<String>('pdf_path'),
          'description': row.read<String>('description'),
        });
      }).toList();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future countFavorite() async {
    try {
      final favorite = await (select(favoriteModel)
            ..where((tbl) =>
                tbl.userId.equals(int.parse(DBService.get("userId")!))))
          .get();
      return favorite.length;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addToFavorite(Insertable<favorites> favorite) async {
    try {
      await into(this.favoriteModel).insert(favorite);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteFavorite(id) async {
    try {
      await (delete(favoriteModel)
            ..where((favorite) => favorite.bookId.equals(id)))
          .go();
    } catch (e) {
      throw Exception(e);
    }
  }
}
