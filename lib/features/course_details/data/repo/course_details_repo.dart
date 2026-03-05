import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supa =  Supabase.instance.client;
  Future<Either<String,void>> enrollcourses(coursesId,usersId) async {
    try {
      // final response = await supa.from('Enrollments').select()
      // .eq('courses_id',coursesId)
      // .eq('users_id',usersId)
      // .maybeSingle();
      // if (response != null)
      // {
      //   return Left('Already Enrolled');
      // }
      //print('hello from new courses repooo');
    final res = await supa.from('Enrollments').insert({
      'courses_id':coursesId,
      'users_id':usersId
    });
    return Right(null);
  }
  catch(e){
    return Left(e.toString());
  }
  }


  Future <Either<String,bool>>checkenrollment(
    {required String coursesId,required String usersId})
  async{
    try{
      final response = await supa.from('Enrollments').select()
      .eq('courses_id',coursesId)
      .eq('users_id',usersId)
      .maybeSingle();
        return right(response!=null);
    }
    catch(e){
      return Left(e.toString());
    }
    
  }
}
