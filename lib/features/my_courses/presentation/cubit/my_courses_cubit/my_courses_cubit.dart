import 'package:courses_app/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:courses_app/features/my_courses/presentation/cubit/my_courses_cubit/my_courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;
  MyCoursesCubit(this.myCoursesRepo) : super(MyCoursesInitialState());

  Future<void> getMyCourses() async {
    emit(MyCoursesLoadingState());
    final res = await myCoursesRepo.getCourses();
    res.fold(
      (error) {
        emit(MyCoursesErrorState(error));
        },
      (courses) {
        emit(MyCoursesSuccessState(courses));
        },
    );
  }
}
