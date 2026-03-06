import 'package:courses_app/features/courses_videos/data/models/courses_videos_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoursesVideosRepo {
  final supa = Supabase.instance.client;

  Future<Either<String,List<CoursesVideosModel>>> getCourseVideos(String courseId) 
  async {
    try{
      final res = await supa.from('videos').select().eq('courses_id', courseId);
      final List<CoursesVideosModel>coursesVideos =[];
      for (var coursesvideos in res )
      {
        coursesVideos.add(CoursesVideosModel.fromSupabase(coursesvideos));
      }
      return right(coursesVideos);
    }
    catch(e){
      return left(e.toString());
    }
  }
}