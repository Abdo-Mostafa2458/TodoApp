import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeAppLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    notifyListeners();
  }

  bool isLight() {
    return appTheme == ThemeMode.light;
  }
}

class AppHomeScreen extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
