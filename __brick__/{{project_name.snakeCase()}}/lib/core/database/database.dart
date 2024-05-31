import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/test/test_dao.dart';
import 'entity/test/test_entity.dart';

part 'database.g.dart';
// ignore_for_file: library_private_types_in_public_api

@Database(version: 1, entities: [
  TestEntity,
])
abstract class AppDatabase extends FloorDatabase {
  TestDao get testDao;
}
