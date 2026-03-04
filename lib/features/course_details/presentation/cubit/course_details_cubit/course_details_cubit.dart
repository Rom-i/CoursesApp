import 'package:courses_app/features/course_details/data/repo/course_details_repo.dart';
import 'package:courses_app/features/course_details/presentation/cubit/course_details_cubit/course_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  CourseDetailsCubit(this.courseDetailsRepo) : super(CourseDetailsInitial());

  Future<void> EnrollCourse(courseId,userId) async {
    emit(CourseDetailsLoading());
    try {
    final res = await courseDetailsRepo.Enrollcourses(courseId, userId);
    }
    on Exception catch(e){
      emit(CourseDetailsError(e.toString()));
    }
    catch (e){
      emit(CourseDetailsError(e.toString()));
    }
  }
}