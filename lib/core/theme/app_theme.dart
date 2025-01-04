import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_post_app/core/theme/app_pallete.dart';

class AppTheme {
  /// Dark Theme
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 20, color: DarkAppPalette.textColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DarkAppPalette.floatingActionButtonColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: DarkAppPalette.listTileColor,
      titleTextStyle: TextStyle(fontSize: 16, color: DarkAppPalette.textColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textTheme: GoogleFonts.latoTextTheme().apply(
      bodyColor: DarkAppPalette.textColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: DarkAppPalette.progressIndicatorColor,
    ),
  );

  /// Light Theme
  static final lightThemeMode = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 20, color: LightAppPalette.textColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: LightAppPalette.floatingActionButtonColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: LightAppPalette.listTileColor,
      titleTextStyle: TextStyle(fontSize: 16, color: LightAppPalette.textColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textTheme: GoogleFonts.latoTextTheme().apply(
      bodyColor: LightAppPalette.textColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: LightAppPalette.progressIndicatorColor,
    ),
  );
}
