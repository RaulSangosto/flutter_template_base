import 'package:floor/floor.dart';

@entity
class TestEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;

  TestEntity({
    this.id,
    required this.title,
  });
}
