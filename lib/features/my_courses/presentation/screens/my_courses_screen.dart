import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:courses_app/features/my_courses/presentation/cubit/my_courses_cubit/my_courses_cubit.dart';
import 'package:courses_app/features/my_courses/presentation/cubit/my_courses_cubit/my_courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) { 
        return MyCoursesCubit(MyCoursesRepo())..getMyCourses();
        },
      child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text('My Courses',
            style: AppTextStyles.mains30regular),
            centerTitle: true,
            elevation: 4,
          ),
          body:
          state is MyCoursesLoadingState?
           Center(child: CircularProgressIndicator(),)
          :
          state is MyCoursesErrorState?
          Center(child: Text(state.errmsg),)
          :
          state is MyCoursesSuccessState?
          state.courses.isEmpty?
          Center(child: Text('Not enrolled courses yet'))

           :ListView.builder(
            itemCount: state.courses.length,
            itemBuilder: (context, index){
            return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    boxShadow:[BoxShadow(blurRadius: 10,offset: Offset(1, 1))],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          state.courses[index].image,
                        fit: BoxFit.contain,
                        width: MediaQuery.sizeOf(context).width*0.33,
                        ),
                        Expanded(
                          child: 
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.courses[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.coursetitle,
                                ),
                                SizedBox(height: 10,),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: (){}, 
                                  child: Text('Completed course',
                                  style: AppTextStyles.s18w400W,
                                  ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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