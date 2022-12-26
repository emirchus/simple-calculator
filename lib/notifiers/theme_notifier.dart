import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}

class ThemeProvider extends InheritedNotifier<ThemeNotifier> {
  const ThemeProvider({super.key, required super.child, required super.notifier});

  static ThemeProvider of(BuildContext context) => context.findAncestorWidgetOfExactType<ThemeProvider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
