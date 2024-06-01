import 'package:injectable/injectable.dart';
import '../../../app/di/injectable.dart';
import '../../data/repository/test/test_repository.dart';
import '../../model/test/test_model.dart';

@injectable
class AddTestUseCase {
  final TestRepository _repository = getIt<TestRepository>();

  Future<int> call(TestModel test) {
    return _repository.addTest(test);
  }
}
