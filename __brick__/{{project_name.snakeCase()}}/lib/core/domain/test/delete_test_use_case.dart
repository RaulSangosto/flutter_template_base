import '../../model/test/test_model.dart';
import 'package:injectable/injectable.dart';
import '../../../app/di/injectable.dart';
import '../../data/repository/test/test_repository.dart';

@injectable
class DeleteTestUseCase {
  final TestRepository _repository = getIt<TestRepository>();

  Future<void> call(TestModel test) {
    return _repository.deleteTest(test);
  }
}
