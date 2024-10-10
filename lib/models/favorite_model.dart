import 'package:drift/drift.dart';
import 'package:e_library_ciheul/models/books_model.dart';
import 'package:e_library_ciheul/models/user_model.dart';

import '../core.dart';

@DataClassName("favorites")
class FavoriteModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer().references(BooksModel, #id)();
  IntColumn get userId => integer().references(Users, #id)();
}

class FavoriteBook {
  final int id;
  final int bookId;
  final int categoryId;
  final String title;
  final String author;
  final String coverPath;
  final String pdfPath;
  final String description;

  FavoriteBook({
    required this.id,
    required this.bookId,
    required this.title,
    required this.categoryId,
    required this.author,
    required this.coverPath,
    required this.pdfPath,
    required this.description,
  });

  // Factory constructor untuk membuat instance dari Map
  factory FavoriteBook.fromMap(Map<String, dynamic> map) {
    return FavoriteBook(
      id: map['id'],
      categoryId: map['categoryId'],
      bookId: map['bookId'],
      title: map['title'],
      author: map['author'],
      coverPath: map['coverPath'],
      pdfPath: map['pdfPath'],
      description: map['description'],
    );
  }
}
