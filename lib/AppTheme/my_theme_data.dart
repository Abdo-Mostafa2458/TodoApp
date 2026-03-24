import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/AppColors/app_colors.dart';

class myThemeData {
  static final ThemeMode themeAppMode = ThemeMode.light;
  static final ThemeData appThemeLight = ThemeData(
      appBarTheme: AppBarTheme(
          color: AppColorsLight.appbarBlueColor,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColorsLight.whiteColor)),
      scaffoldBackgroundColor: AppColorsLight.mainGrayColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColorsLight.whiteColor),
          bodyMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: AppColorsLight.blackColor),
          bodySmall: GoogleFonts.poppins(
              fontSize: 17, color: AppColorsLight.blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColorsLight.appbarBlueColor,
          unselectedItemColor: AppColorsLight.whiteOFFColor,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 35)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColorsLight.appbarBlueColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: AppColorsLight.whiteColor, width: 4))),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(2),
        shape: const CircularNotchedRectangle(),
      ));
  static final ThemeData appThemeDark =
      ThemeData(appBarTheme: AppBarTheme(color: Colors.red));
}
