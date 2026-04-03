import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppRoute/app_routes.dart';
import 'package:todo_app/AppTheme/my_theme_data.dart';
import 'package:todo_app/Provider/provider.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppSettings(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppHomeScreen(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppSettings>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        AppRoutes.splashScreen: (context) => SplashScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen()
      },
      theme: myThemeData.appThemeLight,
      darkTheme: myThemeData.appThemeDark,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      initialRoute: AppRoutes.splashScreen,
    );
  }
}


