import 'package:courses_app/features/home/data/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo {
  static final supa = Supabase.instance.client;
  static final usersId = Supabase.instance.client.auth.currentUser!.id;
  Future <Either<String,List<CourseModel>>> getCourses() async {
    try {
    final res = await supa
    .from('Enrollments')
    .select('courses(*)')
    .eq('users_id', usersId);
    List<CourseModel> courses = [];
    for (var course in res){
      courses.add(CourseModel.fromJson(course['courses']));
    }
    return Right(courses);
    } catch (e) {
      return Left(e.toString());
    }
  }
}