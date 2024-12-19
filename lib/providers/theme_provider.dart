import 'package:easy_weather/services/theme_mode_saver.dart';
import 'package:easy_weather/utils/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeMode = CustomAThemeMode().lightMode;

  ThemeProvider() {
    _loadTheme();
  }

  final ThemeModeSaver _themeModeSaver = ThemeModeSaver();

  // getter
  ThemeData get getThemeMode => _themeMode;

  // setter
  set setThemeMode(ThemeData theme) {
    _themeMode = theme;
    notifyListeners();
  }

  // Load the theme from shared preferences
  Future<void> _loadTheme() async {
    bool isDark = await _themeModeSaver.loadTheme();
    setThemeMode =
        isDark ? CustomAThemeMode().darkMode : CustomAThemeMode().lightMode;
  }

  // toggle theme
  Future<void> toggleTheme(bool isDark) async {
    setThemeMode =
        isDark ? CustomAThemeMode().darkMode : CustomAThemeMode().lightMode;

    await _themeModeSaver.storeTheme(isDark);
    notifyListeners();
  }
}
