import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/features/courses_videos/data/repo/courses_videos_repo.dart';
import 'package:courses_app/features/courses_videos/presentation/cubit/courses_videos_cubit/courses_videos_cubit.dart';
import 'package:courses_app/features/courses_videos/presentation/cubit/courses_videos_cubit/courses_videos_state.dart';
import 'package:courses_app/features/videoooo/presentation/screen/videooopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesVideos extends StatelessWidget {
  const CoursesVideos({super.key, required this.coursesId});
  final String coursesId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>CoursesVideosCubit(CoursesVideosRepo())..getVideos(coursesId.toString()),
      child: BlocBuilder<CoursesVideosCubit, CoursesVideosState>(
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text("Courses Videos",
              style: AppTextStyles.mains30regular,
            ),
            centerTitle: true,
            elevation: 4,
          ),
          body: 
          
          
          state is CoursesVideosLoadingState?
           Center(child: CircularProgressIndicator(),)
          :
          state is CoursesVideosErrorState?
          Center(child: Text(state.errmsg),)
          :
          state is CoursesVideosSuccessState?
          state.videos.isEmpty?
          Center(child: Text('Videos not avalible'))
          :
          
          ListView.builder(
            itemCount: state.videos.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        boxShadow:[BoxShadow(blurRadius: 10,offset: Offset(1, 1))],
                        borderRadius: BorderRadius.circular(16),
                      ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    trailing: const Icon(Icons.play_circle_fill,
                    color: AppColors.primaryColor),
                    title: Text(
                      state.videos[index].title,
                      style: AppTextStyles.coursetitle,
                    ),
                    subtitle: Text(
                      state.videos[index].desc,
                      style: AppTextStyles.coursetitle,
                      ),
                      onTap: () {
                        Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context){
                            return ContentPage(courseId: state.videos[index].id.toString());
                          }
                        )
                        );
                      },
                  ),
                ),
              );
            }
            ):SizedBox()
        );
        }
      ),
    );
  }
}