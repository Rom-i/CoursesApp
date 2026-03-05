import 'package:courses_app/features/home/data/models/course_model.dart';

abstract class MyCoursesState {}
final class MyCoursesInitialState extends MyCoursesState {}

final class MyCoursesLoadingState extends MyCoursesState {}

final class MyCoursesSuccessState extends MyCoursesState {
  final List<CourseModel> courses;
  MyCoursesSuccessState(this.courses);
}

final class MyCoursesErrorState extends MyCoursesState {
  final String errmsg;
  MyCoursesErrorState(this.errmsg);
}
