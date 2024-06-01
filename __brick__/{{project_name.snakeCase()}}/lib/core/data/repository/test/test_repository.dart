import '../../../model/test/test_model.dart';

abstract class TestRepository {
  Stream<List<TestModel>> getTests();
  Stream<TestModel?> getTestById(int id);
  Future<int> addTest(TestModel test);
  Future<void> deleteTest(TestModel test);
}
