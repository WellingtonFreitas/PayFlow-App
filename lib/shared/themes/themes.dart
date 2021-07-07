 import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes{
  static final lightTheme = ThemeData(
        primarySwatch: Colors.blue, 
        primaryColor: AppColors.primary,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
        static final darkTheme = ThemeData(
        primarySwatch: Colors.blue, 
        primaryColor: AppColors.primary,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
