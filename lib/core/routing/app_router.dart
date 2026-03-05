import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:courses_app/features/course_details/presentation/screens/course_details.dart';
import 'package:courses_app/features/home/data/models/course_model.dart';
import 'package:courses_app/features/home/presentation/screens/home.dart';
import 'package:courses_app/features/layout/presentation/screens/layout_bottom_navbar.dart';
import 'package:courses_app/features/my_courses/presentation/screens/my_courses_screen.dart';
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