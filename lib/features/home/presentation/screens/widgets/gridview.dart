import 'package:courses_app/core/routing/routes.dart';
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
  physics: const NeverScrollableScrollPhysics(),
  itemCount: courses.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 0.75, 
  ),
  itemBuilder: (context, index) {
    final course = courses[index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor),
        color: AppColors.secondaryColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                course.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            course.title,
            style: AppTextStyles.s18w600,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, 
          ),
          const SizedBox(height: 4),
          Text(
            '${course.price} USD',
            style: AppTextStyles.s18w600,
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity, 
            child: CustomButton(
              text: 'Details',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.coursedetails,
                  arguments: course,
                );
              },
            ),
          ),
        ],
      ),
    );
  },
),
      ),
    );
  }
}