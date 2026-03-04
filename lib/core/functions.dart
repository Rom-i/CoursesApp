import 'package:flutter/material.dart';

void snakBarMessage({required BuildContext context ,required String text}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}