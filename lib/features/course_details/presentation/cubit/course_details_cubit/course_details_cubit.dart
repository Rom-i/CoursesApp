import 'package:courses_app/features/course_details/data/repo/course_details_repo.dart';
import 'package:courses_app/features/course_details/presentation/cubit/course_details_cubit/course_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  CourseDetailsCubit(this.courseDetailsRepo) : super(EnrollIntialState());

  Future<void> enrollCourse(courseId,userId) async {
    emit(EnrollLoadingState());
    final res = await courseDetailsRepo.enrollcourses(courseId, userId);
    res.fold((l) => emit(EnrollErrorState(l)), (r) { 
      print('from cubit');
      emit(EnrollSuccessState());
    });
  }
  Future <void>checkenrollment(
  {required String coursesId,required String usersId})
  async{
    final result = await courseDetailsRepo.checkenrollment(
      coursesId: coursesId, 
      usersId: usersId);
      result.fold(
        (error){
          emit(EnrollErrorState(error));
        },
        (isEnrolled){
          if (isEnrolled){
            emit(AlreadyEnrollState());
          }
          else{
            emit(NotEnrolledState());
          }
        }
      );
  }
}