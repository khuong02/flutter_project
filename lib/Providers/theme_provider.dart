import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool themeMode = true;


  void toggleTheme() {
    themeMode = !themeMode;
  }

  void setTheme(bool theme){
    themeMode = theme;
  }

  bool get getThemeMode {
    return themeMode;
  }
}