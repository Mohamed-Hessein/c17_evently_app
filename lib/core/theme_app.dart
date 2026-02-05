import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/app_colors.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(brightness: Brightness.light, primary: Colors.white, onPrimary:  Colors.white, secondary: Colors.white, onSecondary: AppColors.blueApp, error: Colors.red, onError: Colors.red, surface: Color(0xFFF4F7FF), onSurface: Colors.white),


  textTheme: TextTheme(bodyLarge: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF1C1C1C)),
      bodyMedium: StylesApp.style16Bold,
      bodySmall: StylesApp.style14Bold,
      labelMedium: StylesApp.style16BlueBold,displayLarge:StylesApp.style20WhiteBold
      ,
      titleLarge: StylesApp.style20WhiteBold.copyWith(color: Colors.black),displayMedium: StylesApp.style24BlueBold,
          labelSmall: StylesApp.style18Blue500,
      labelLarge: StylesApp.style14BlueBold),
      iconTheme: IconThemeData(color: Colors.black));


  static final ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: AppColors.blueApp, onPrimary:   Colors.white, secondary: Colors.white, onSecondary: AppColors.blueApp, error: Colors.red, onError: Colors.red, surface: Color(0xFF000F30), onSurface: Color(0xFF1C1C1C)),


      textTheme: TextTheme(bodyLarge: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          bodyMedium:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
          bodySmall: StylesApp.style14Bold.copyWith(),
          labelMedium: StylesApp.style16BlueBold.copyWith(color: Colors.white),
          titleLarge: StylesApp.style20WhiteBold,displayMedium: StylesApp.style24BlueBold,
          labelSmall: StylesApp.style18Blue500,
          labelLarge: StylesApp.style14BlueBold),
      iconTheme: IconThemeData(color: AppColors.blueApp),

  chipTheme: ChipThemeData(backgroundColor: Color(0xFF002D8F,))
  );

}