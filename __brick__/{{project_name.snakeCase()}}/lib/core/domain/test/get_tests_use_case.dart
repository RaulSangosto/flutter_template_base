import '../../model/test/test_model.dart';
import 'package:injectable/injectable.dart';
import '../../../app/di/injectable.dart';
import '../../data/repository/test/test_repository.dart';

@injectable
class GetTestsUseCase {
  final TestRepository _repository = getIt<TestRepository>();

  Stream<List<TestModel>> call() {
    return _repository.getTests();
  }
}
