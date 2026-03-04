import 'package:courses_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextformField extends StatelessWidget {
  const TextformField({super.key, this.text,
   this.prefixIcon, this.validator});
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:TextStyle(
        color: AppColors.secondaryColor
      ) ,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
      fillColor: AppColors.secondaryColor,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      hintText: text,
      ),
    );
  }
}