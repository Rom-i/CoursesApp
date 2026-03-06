import 'package:courses_app/features/courses_videos/data/models/courses_videos_model.dart';

abstract class CoursesVideosState {}

final class CoursesVideosInitialState extends CoursesVideosState{}

final class CoursesVideosLoadingState extends CoursesVideosState{}

final class CoursesVideosSuccessState extends CoursesVideosState{
  final List<CoursesVideosModel> videos;
  CoursesVideosSuccessState(this.videos);

}

final class CoursesVideosErrorState extends CoursesVideosState{
  final String errmsg;
  CoursesVideosErrorState(this.errmsg);

}