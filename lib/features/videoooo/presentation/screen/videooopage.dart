import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/videoooo/data/repo/video_repo.dart';
import 'package:courses_app/features/videoooo/presentation/cubit/video_cubit.dart';
import 'package:courses_app/features/videoooo/presentation/cubit/videooo_state.dart';
import 'package:courses_app/features/videoooo/presentation/screen/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentPage extends StatelessWidget {
  final String courseId;
  const ContentPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    print('courseId: $courseId');
    return BlocProvider(
      create: (context) =>
          ContentCubit(contentRepo: ContentRepo(), courseId: courseId)
            ..getContent(),
      child: Scaffold(
        appBar: AppBar(title: Text('Content')),
        body: SafeArea(
          child: BlocBuilder<ContentCubit, ContentState>(
            builder: (context, state) {
              if (state.status == ContentStatus.error) {
                return Center(child: Text(state.error));
              }
              if (state.status == ContentStatus.success) {
                return ListView.builder(
                  itemCount: state.content.length,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemBuilder: (context, index) {
                    final lesson = state.content[index];
                    return VideoCard(
                      title: lesson.title,
                      subtitle: lesson.desc,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.videoooo,
                          arguments: lesson.videoUrl,
                        );
                      },
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}