import '../../../core/model/test/test_model.dart';

sealed class HomeEvent {}

class OnAddTestEvent extends HomeEvent {
  final TestModel test;
  OnAddTestEvent(this.test);
}

class OnChangeTestTitleEvent extends HomeEvent {
  final TestModel test;
  OnChangeTestTitleEvent(this.test);
}

class OnDeleteTestEvent extends HomeEvent {
  final TestModel test;
  OnDeleteTestEvent(this.test);
}
