import 'package:injectable/injectable.dart';
import '../database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
