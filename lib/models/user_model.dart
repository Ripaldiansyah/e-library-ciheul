import 'package:drift/drift.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 30)();
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get role => text()();
}
