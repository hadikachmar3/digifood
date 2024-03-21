import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeColorClass {
  static themeData() => ThemeData(
        scaffoldBackgroundColor: AppColors.lightScaffoldColor,
        primaryColor: AppColors.lightCardColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.lightIconsColor,
          ),
          backgroundColor: AppColors.lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.lightTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: AppColors.lightIconsColor,
        ),
        cardColor: AppColors.lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: AppColors.lightIconsColor,
              brightness: Brightness.light,
            ),
      );
}
