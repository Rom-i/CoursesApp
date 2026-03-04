import 'package:courses_app/core/constants/app_colors.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height*0.25,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          )
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 10),
                child: Text('Courses App',
                style: AppTextStyles.mains30regular,
                ),
              ),
              Text(text,
              style: AppTextStyles.mains20regular
              ),
            ],
          ),
        ),
      );
  }
}