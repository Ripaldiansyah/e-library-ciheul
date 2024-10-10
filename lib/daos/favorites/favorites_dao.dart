import 'package:drift/drift.dart';
import 'package:e_library_ciheul/shared/util/db_service/db_service.dart';

import '../../core.dart';
import '../../models/favorite_model.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [FavoriteModel])
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
