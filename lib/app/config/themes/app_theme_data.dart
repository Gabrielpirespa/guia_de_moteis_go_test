import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeData {
  static ThemeData primaryTheme() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: AppTheme.colors.backgroundColor,
        inputDecorationTheme: _inputDecorationTheme,
        appBarTheme: _appBarTheme,
        outlinedButtonTheme: _outlinedButtonThemeData,
        dividerTheme: _dividerThemeData,
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      backgroundColor: AppTheme.colors.primaryColor,
      titleTextStyle: TextStyle(
          color: AppTheme.colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24));

  static OutlinedButtonThemeData get _outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppTheme.colors.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          side: BorderSide(color: AppTheme.colors.gray),
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme {
    final borderRadius = BorderRadius.circular(6.0);

    return InputDecorationTheme(
      fillColor: Colors.white,
      focusColor: AppTheme.colors.primaryColor,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 12.0,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppTheme.colors.lightGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppTheme.colors.lightGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppTheme.colors.lightGray,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppTheme.colors.darkRed,
          width: 2.0,
        ),
      ),
    );
  }

  static DividerThemeData get _dividerThemeData => DividerThemeData(
        color: AppTheme.colors.lightGray,
        thickness: 1.0,
      );
}
