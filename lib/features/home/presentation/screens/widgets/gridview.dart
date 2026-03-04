import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/course_details/presentation/screens/course_details.dart';
import 'package:flutter/material.dart';
import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/core/widgets/custom_button.dart';

class CoursesGridView extends StatelessWidget {
  final List courses;

  const CoursesGridView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 3,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primaryColor),
                  color: AppColors.secondaryColor,
                ),
                margin: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Image.network(
                      course.image,
                      fit: BoxFit.contain,
                      // يمكنك إضافة placeholder أو error widget هنا
                    ),
                    const SizedBox(height: 10),
                    Text(
                      course.title,
                      style: AppTextStyles.s18w600,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${course.price} USD',
                      style: AppTextStyles.s18w600,
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: CustomButton(
                        text: 'Details', 
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.coursedetails,
                          arguments: course);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}