import 'package:flutter/material.dart';
import 'package:todo_app/AppRoute/app_routes.dart';
import 'package:todo_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {AppRoutes.homeScreen: (context) => HomeScreen()},
      initialRoute: AppRoutes.homeScreen,
    );
  }
}


