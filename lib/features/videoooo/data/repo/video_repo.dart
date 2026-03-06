import 'package:courses_app/features/videoooo/data/model/videoo_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContentRepo {
  final supa = Supabase.instance.client;
  Future<Either<String, List<VideoModel>>> getContent(String Id) async {
    try {
      final res = await supa.from('videos').select().eq('id', Id);
      print('RESULT: $res');
      return right(res.map((e) => VideoModel.fromSopabase(e)).toList());
    } catch (e) {
      print('ERROR: $e');
      return left(e.toString());
    }
  }
}