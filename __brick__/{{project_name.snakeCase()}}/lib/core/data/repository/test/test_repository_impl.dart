import '../../../../core/database/mappers/test_mapper.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/di/injectable.dart';
import '../../../database/database.dart';
import '../../../model/test/test_model.dart';
import 'test_repository.dart';

@Singleton(as: TestRepository)
class TestRepositoryImpl extends TestRepository {
  final AppDatabase _database = getIt<AppDatabase>();

  @override
  Future<int> addTest(TestModel test) {
    if (test.id != null) {
      return _database.testDao.updateTest(test.toEntity());
    }
    return _database.testDao.insertTest(test.toEntity());
  }

  @override
  Future<void> deleteTest(TestModel test) {
    return _database.testDao.deleteTest(test.toEntity());
  }

  @override
  Stream<List<TestModel>> getTests() {
    return _database.testDao
        .findAllTest()
        .map((items) => items?.map((test) => test.toModel()).toList() ?? []);
  }

  @override
  Stream<TestModel?> getTestById(int id) {
    return _database.testDao.findTestById(id).map((test) => test?.toModel());
  }
}
