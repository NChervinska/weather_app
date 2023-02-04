import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData createTheme() {
  final inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.green,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.red,
        width: 2,
      ),
    ),
  );

  final textSelectionTheme = TextSelectionThemeData(
    cursorColor: AppColors.greenLight,
    selectionColor: AppColors.greenLight,
    selectionHandleColor: AppColors.greenLight,
  );

  final colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.green,
    onPrimary: AppColors.white,
    error: AppColors.red,
  );

  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(AppColors.white),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return AppColors.grey;

          if (states.contains(MaterialState.pressed)) {
            return AppColors.greenLight;
          }

          return AppColors.green;
        },
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20),
      ),
    ),
  );

  final themeData = ThemeData(
    colorScheme: colorScheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: textSelectionTheme,
    primaryColor: AppColors.green,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
  );
  return themeData;
}
