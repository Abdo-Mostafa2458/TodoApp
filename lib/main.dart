import 'package:flutter/material.dart';
import 'package:todo_app/AppRoute/app_routes.dart';
import 'package:todo_app/AppTheme/my_theme_data.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.splashScreen: (context) => SplashScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen()
      },
      theme: myThemeData.appThemeLight,
      darkTheme: myThemeData.appThemeDark,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}


