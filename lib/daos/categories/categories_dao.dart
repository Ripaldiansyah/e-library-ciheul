import 'package:drift/drift.dart';

import '../../core.dart';
import '../../models/categories_model.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(AppDatabase db) : super(db);

  Future<List<Category>> getAllCategories() => select(categories).get();
  Future<List<Map<String, dynamic>>> getCategoryLabels() async {
    final result = await customSelect(
      'SELECT id, label FROM categories',
      readsFrom: {categories},
    ).get();

    return result.map((row) {
      return {
        'value': row.read<String>('id'),
        'label': row.read<String>('label'),
      };
    }).toList();
  }

  Future insertCategory(Insertable<Category> category) async {
    try {
      await transaction(() async {
        await into(this.categories).insert(category);
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> categoryIsRegistered(String label) async {
    final category = await (select(categories)
          ..where((tbl) => tbl.label.equals(label)))
        .getSingleOrNull();

    if (category != null) {
      return true;
    }
    return false;
  }
}
