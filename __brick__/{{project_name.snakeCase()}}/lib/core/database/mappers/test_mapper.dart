import '../../model/test/test_model.dart';
import '../entity/test/test_entity.dart';

extension TestModelMapper on TestModel {
  TestEntity toEntity() => TestEntity(
        id: id,
        title: title,
      );
}

extension TestEntityMapper on TestEntity {
  TestModel toModel() => TestModel(
        id: id,
        title: title,
      );
}
