import 'package:courses_app/core/networking/supabase_services.dart';
import 'package:courses_app/core/routing/app_router.dart';
import 'package:courses_app/core/routing/routes.dart';
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
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: AppRoutes.splashscreen,
    );
  }
}