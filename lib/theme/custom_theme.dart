import 'package:flutter/material.dart';

final appThemData = {
  
  "Ligth": ThemeData(
      brightness: Brightness.light, 
      primaryColor: CustomColors.laranja,
      scaffoldBackgroundColor: CustomColors.laranja,
    ),

  "Dark": ThemeData(
    brightness: Brightness.dark,
    primaryColor: CustomColors.cinza500,
    scaffoldBackgroundColor: CustomColors.cinza500
    )
};

class CustomColors {
  const CustomColors();

  static const laranja = Color(0xFFD39733);
  static const cinza500 = Color(0xFF353535);
  static const cinza100 = Color(0xFF555555);
  static const preto = Color(0xFF202020);
  static const roxo = Color(0xFF5B466A);
}