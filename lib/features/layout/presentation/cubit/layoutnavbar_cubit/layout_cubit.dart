import 'package:courses_app/features/home/presentation/screens/home.dart';
import 'package:courses_app/features/layout/presentation/cubit/layoutnavbar_cubit/layout_state.dart';
import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:courses_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit <LayoutBottomNavBarState>{
  LayoutCubit() : super(InitialBottomNavIndex());

  int currentIndex = 0;
  List<Widget> screens = [Home(),SignupScreen(),LoginScreen()];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndex());
  }
}