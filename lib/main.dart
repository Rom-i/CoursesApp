//import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
//import 'package:courses_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:courses_app/core/networking/supabase_services.dart';
import 'package:courses_app/core/routing/app_router.dart';
import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/layout/presentation/screens/layout_bottom_navbar.dart';
import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courses App',
      //home: const LayoutBottomNavbar(),
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: AppRoutes.homescreen,
    );
  }
}