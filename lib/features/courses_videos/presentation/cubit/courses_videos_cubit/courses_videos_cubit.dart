import 'package:courses_app/features/courses_videos/data/repo/courses_videos_repo.dart';
import 'package:courses_app/features/courses_videos/presentation/cubit/courses_videos_cubit/courses_videos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesVideosCubit extends Cubit<CoursesVideosState>{
  final CoursesVideosRepo coursesVideosRepo;
  CoursesVideosCubit(this.coursesVideosRepo) : super(CoursesVideosInitialState());

  Future<void> getVideos(coursesId) async{
    emit(CoursesVideosLoadingState());
    final res = await coursesVideosRepo.getCourseVideos(coursesId);
    res.fold(
      (error){
        emit(CoursesVideosErrorState(error));
      },
      (videos){
        emit(CoursesVideosSuccessState(videos));
      }
      );
  }
}