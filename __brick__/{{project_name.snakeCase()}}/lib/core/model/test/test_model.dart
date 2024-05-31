class TestModel {
  final int? id;
  final String title;

  TestModel({this.id, required this.title});

  TestModel copyWith({int? id, String? title}) {
    return TestModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
