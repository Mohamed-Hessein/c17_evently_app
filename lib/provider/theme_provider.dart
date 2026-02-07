import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  changTheme(ThemeMode mode){
     themeMode = mode;
     notifyListeners();
  }

}