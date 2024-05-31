import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'dao/test/test_dao.dart';
import 'entity/test/test_entity.dart';

part 'database.g.dart';
// ignore_for_file: library_private_types_in_public_api

@TypeConverters([])
@Database(version: 1, entities: [
  TestEntity,
])
abstract class AppDatabase extends FloorDatabase {
  TestDao get testDao;
}