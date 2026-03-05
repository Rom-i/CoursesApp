import 'package:courses_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CoursesVideos extends StatelessWidget {
  const CoursesVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses Videos",
          style: AppTextStyles.mains20regular
        ),
        centerTitle: true,
      ),
    );
  }
}