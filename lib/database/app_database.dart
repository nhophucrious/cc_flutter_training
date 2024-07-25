import 'dart:async';
import 'package:cc_flutter_training/ui/models/address_model.dart';
import 'package:cc_flutter_training/ui/models/company_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../database/daos/user_dao.dart';
import '../ui/models/user_model.dart';

part 'app_database.g.dart';


/*
@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
*/
// migration example
// bump the database version to 2, with dropped columns

@Database(version: 2, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}

// create migration
final migration1to2 = Migration(1, 2, (database) async {
  // remove company and phone columns
  await database.execute('''
    CREATE TABLE user_temp (
      id INTEGER PRIMARY KEY NOT NULL,
      name TEXT NOT NULL,
      username TEXT NOT NULL,
      email TEXT NOT NULL,
      address TEXT NOT NULL,
      website TEXT NOT NULL
    );
  ''');

  await database.execute('''
    INSERT INTO user_temp (id, name, username, email, address, website)
    SELECT id, name, username, email, address, website
    FROM user;
  ''');

  await database.execute('DROP TABLE user;');
  await database.execute('ALTER TABLE user_temp RENAME TO user;');
});