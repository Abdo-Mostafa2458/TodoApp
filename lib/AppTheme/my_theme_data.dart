import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/AppColors/app_colors.dart';

class myThemeData {
  static final ThemeMode themeAppMode = ThemeMode.light;
  static final ThemeData appThemeLight = ThemeData(
      appBarTheme: AppBarTheme(
          color: AppColorsLight.appbarBlueColor,
          foregroundColor: AppColorsLight.whiteColor,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColorsLight.whiteColor)),
      scaffoldBackgroundColor: AppColorsLight.mainGrayColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColorsLight.whiteColor)));
  static final ThemeData appThemeDark =
      ThemeData(appBarTheme: AppBarTheme(color: Colors.red));
}
