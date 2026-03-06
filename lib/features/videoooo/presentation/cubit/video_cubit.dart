import 'package:courses_app/features/videoooo/data/repo/video_repo.dart';
import 'package:courses_app/features/videoooo/presentation/cubit/videooo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentCubit extends Cubit<ContentState> {
  final String courseId;
  final ContentRepo contentRepo;
  ContentCubit({required this.contentRepo, required this.courseId})
    : super(ContentState());
  Future<void> getContent() async {
    emit(ContentState(status: ContentStatus.loading));
    final res = await contentRepo.getContent(courseId);
    res.fold(
      (error) => emit(ContentState(status: ContentStatus.error, error: error)),
      (success) =>
          emit(ContentState(status: ContentStatus.success, content: success)),
    );
  }
}