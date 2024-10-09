import 'package:drift/drift.dart';
import 'package:e_library_ciheul/database/app_database.dart';

import '../../models/categories_model.dart';
part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(AppDatabase db) : super(db);

  Future<List<Category>> getAllCategories() => select(categories).get();
  Future<List<Map<String, dynamic>>> getCategoryLabels() async {
    final result = await customSelect(
      'SELECT label FROM categories',
      readsFrom: {categories},
    ).get();

    return result.map((row) {
      return {
        'value': row.read<String>('label'),
        'label': row.read<String>('label'),
      };
    }).toList();
  }
}
