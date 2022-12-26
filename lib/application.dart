import 'package:flutter/material.dart';
import 'package:simple_calculator/notifiers/home_notifier.dart';
import 'package:simple_calculator/notifiers/theme_notifier.dart';
import 'package:simple_calculator/screens/home_screen.dart';
import 'package:simple_calculator/theme/app_theme.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final ThemeNotifier _themeNotifier = ThemeNotifier();
  final HomeNotifier _homeNotifier = HomeNotifier();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      notifier: _themeNotifier,
      child: HomeProvider(
        notifier: _homeNotifier,
        child: AnimatedBuilder(
          animation: _themeNotifier,
          builder: (context, child) {
            return MaterialApp(
              themeMode: _themeNotifier.themeMode,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
