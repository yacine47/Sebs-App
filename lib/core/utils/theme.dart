import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebs_app/core/utils/app_colors.dart';

class Themes {
  static final TextStyle lightText = GoogleFonts.nunito(
    textStyle: const TextStyle(
      color: AppColors.blackTextColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: lightText.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      toolbarTextStyle: lightText,
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
    ),
    textTheme: TextTheme(
      displayLarge: lightText,
      displayMedium: lightText,
      displaySmall: lightText,
      headlineLarge: lightText,
      headlineMedium: lightText,
      headlineSmall: lightText,
      titleLarge: lightText,
      titleMedium: lightText,
      titleSmall: lightText,
      bodyLarge: lightText,
      bodyMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelMedium: lightText,
      labelSmall: lightText,
    ),
    useMaterial3: true, // Enable Material 3 (optional but recommended)
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
