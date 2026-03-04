import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/functions.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/core/widgets/custom_button.dart';
import 'package:courses_app/features/course_details/data/repo/course_details_repo.dart';
import 'package:courses_app/features/course_details/presentation/cubit/course_details_cubit/course_details_cubit.dart';
import 'package:courses_app/features/course_details/presentation/cubit/course_details_cubit/course_details_state.dart';
import 'package:courses_app/features/home/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.course});
  final CourseModel course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CourseDetailsCubit(CourseDetailsRepo());
      },
      child: BlocConsumer<CourseDetailsCubit,CourseDetailsState>(
        listener: (context, state) {
          if(state is CourseDetailsError){
            snakBarMessage(context: context, text: state.errmsg);
          }
          if(state is CourseDetailsSuccess){
            snakBarMessage(context: context, text: 'Enrolled Successfully');
          }
        },
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Course Details'),
            leading: Icon(Icons.arrow_back_ios),
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        widget.course.image,
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height*0.35,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => 
                        Container(
                          color: AppColors.secondaryColor,
                          child: Icon(Icons.error,color: Colors.red),
                        ),
                        ),
                    ),
                    SizedBox(height: 20,),
                    Text(widget.course.title,
                    style: AppTextStyles.coursetitle,
                    ),
                    SizedBox(height: 8,),
                    Text(widget.course.price.toString(),
                    style: AppTextStyles.courseprice,
                    ),Text('Description',
                    style: AppTextStyles.coursedescription,
                    ),
                    SizedBox(height: 8,),
                    Text(widget.course.desc,
                    style: AppTextStyles.coursedetails,
                    ),
                    SizedBox(height: 40,),
                    state is CourseDetailsLoading?
                    Center(child: CircularProgressIndicator(),)
                    :
                    Center(
                      child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            child: CustomButton(
                              text: 'Enroll course', 
                              onPressed: () {
                                context.read<CourseDetailsCubit>().EnrollCourse(
                                  widget.course.id,Supabase.instance.client.auth.currentUser!.id);
                              },
                            ),
                          ),
                    ),
                  ],
                ),
              ),
          ),
        );
        }
      ),
    );
  }
}