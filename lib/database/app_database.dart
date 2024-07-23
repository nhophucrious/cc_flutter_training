import 'dart:async';
import 'package:cc_flutter_training/ui/models/address_model.dart';
import 'package:cc_flutter_training/ui/models/company_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../database/daos/user_dao.dart';
import '../ui/models/user_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}