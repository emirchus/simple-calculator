import 'package:flutter/material.dart';
import 'package:simple_calculator/notifiers/theme_notifier.dart';

class ThemeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeNotifier = ThemeProvider.of(context).notifier!;

    final isLight = themeNotifier.themeMode == ThemeMode.light;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.05,
      ),
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: isLight ? const Icon(Icons.light_mode) : const Icon(Icons.light_mode_outlined),
                onPressed: () {
                  themeNotifier.changeTheme(ThemeMode.light);
                },
              ),
              IconButton(
                icon: isLight ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.dark_mode),
                onPressed: () {
                  themeNotifier.changeTheme(ThemeMode.dark);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
