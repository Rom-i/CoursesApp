import 'package:courses_app/core/networking/supabase_services.dart';
import 'package:courses_app/features/home/data/models/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supa =  Supabase.instance.client;
  Future<Either<String,void>> Enrollcourses(coursesId,usersId) async {
    try {
      print('holle from new courses repooo');
    final res = supa.from('Enrollments').insert({
      'courses_id':coursesId,
      'user_id':usersId
    });
    return Right(null);
  }
  catch(e){
    return Left(e.toString());
  }
  }
}
