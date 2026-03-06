import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:courses_app/features/course_details/presentation/screens/course_details.dart';
import 'package:courses_app/features/courses_videos/data/models/courses_videos_model.dart';
import 'package:courses_app/features/courses_videos/presentation/screens/courses_videos.dart';
import 'package:courses_app/features/home/data/models/course_model.dart';
import 'package:courses_app/features/home/presentation/screens/home.dart';
import 'package:courses_app/features/layout/presentation/screens/layout_bottom_navbar.dart';
import 'package:courses_app/features/my_courses/presentation/screens/my_courses_screen.dart';
import 'package:courses_app/features/profile/presentation/screen/profile_screen.dart';
import 'package:courses_app/features/videoooo/presentation/screen/videooopage.dart';
import 'package:courses_app/features/videoooo/presentation/screen/widget/videoooview.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashscreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.loginscreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.signupscreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case AppRoutes.layout:
        return MaterialPageRoute(
          builder: (_) => const LayoutBottomNavbar(),
        );
      case AppRoutes.homescreen:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
        case AppRoutes.coursedetails:
        final course = settings.arguments as CourseModel;
        return MaterialPageRoute(
          builder: (_) => CourseDetails(
            course: course,
          ),
        );

        case AppRoutes.mycourses:
        return MaterialPageRoute(
          builder: (_) => MyCoursesScreen(
          ),
        );

        case AppRoutes.coursesvideos:
        final  courseId = settings.arguments.toString();
        return MaterialPageRoute(
          builder: (_) => CoursesVideos(
            coursesId: courseId,
          ),
        );
        // case AppRoutes.videoscreen:
        // final  videoId = settings.arguments.toString();
        // return MaterialPageRoute(builder: (_)=>
        //  VideoScreen(
        //   coursesVideosModel:settings.arguments as CoursesVideosModel,
        //  )
        // );
        // في الـ routes
        case AppRoutes.profile:
        return MaterialPageRoute(builder: (_)=>
        ProfileScreen()
        );

        //
        case AppRoutes.videoooo:
        final url = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VideoViwer(videoUrl: url));

        
      case AppRoutes.content:
        final courseId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ContentPage(courseId: courseId),
        );



        //


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

}