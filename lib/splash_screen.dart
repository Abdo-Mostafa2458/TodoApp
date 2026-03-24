import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/AppRoute/app_routes.dart';
import 'package:todo_app/AppTheme/my_theme_data.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: myThemeData.themeAppMode == ThemeMode.light
                    ? AssetImage("assets/images/splash_screen_light.png")
                    : AssetImage("assets/images/splash_screen_dark.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
