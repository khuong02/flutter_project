import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool themeMode = true;


  void toggleTheme() {
    themeMode = !themeMode;
  }

  bool get getThemeMode {
    return themeMode;
  }
}