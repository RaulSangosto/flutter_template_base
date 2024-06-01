import 'package:floor/floor.dart';
import '../../entity/test/test_entity.dart';

@dao
abstract class TestDao {
  @insert
  Future<int> insertTest(TestEntity test);

  @update
  Future<int> updateTest(TestEntity test);

  @Query('SELECT * FROM TestEntity')
  Stream<List<TestEntity>?> findAllTest();

  @Query('SELECT * FROM TestEntity WHERE id = :id')
  Stream<TestEntity?> findTestById(int id);

  @delete
  Future<void> deleteTest(TestEntity test);
}
