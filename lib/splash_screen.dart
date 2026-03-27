import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppRoute/app_routes.dart';
import 'package:todo_app/Provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static bool _isNavigated = false;

  void _navigate(BuildContext context) {
    if (_isNavigated) return;
    _isNavigated = true;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppSettings>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate(context);
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: provider.appTheme == ThemeMode.light
                ? const AssetImage("assets/images/splash_screen_light.png")
                : const AssetImage("assets/images/splash_screen_dark.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}