import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/features/home/data/repo/home_repo.dart';
import 'package:courses_app/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:courses_app/features/home/presentation/cubit/home_cubit/home_state.dart';
import 'package:courses_app/features/home/presentation/screens/widgets/custom_form_field.dart';
import 'package:courses_app/features/home/presentation/screens/widgets/gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit(HomeRepo())..getCourses();
      },
      child: BlocConsumer<HomeCubit, HomeState>(
        listener:(context, state) {
          
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height*0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome to Courese App',
                        style: AppTextStyles.s18w400W
                        ),
                        SizedBox(height: 12,),
                        TextformField(
                          prefixIcon: Icon(Icons.search),
                          text: 'What are you looking for?',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
            
                if(state is HomeLoadingState)
                Center(child: CircularProgressIndicator(),),
                if(state is HomeErrorState)
                Text(state.errmsg),
                if(state is HomeSuccessState)
                state.courses.isEmpty ?Center(child: Text('Courses not found'))
                : CoursesGridView(courses: state.courses)
              ],
            ),
                    ),
          );
        }
      ),
    );
  }
}