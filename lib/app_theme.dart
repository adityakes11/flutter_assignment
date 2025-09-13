import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const background = Color(0xFFFFF4E4); // replace
  static const primary = Color(0xFF3366FF); // replace
  static const accent = Color(0xFF00C898); // replace
  static const textPrimary = Color(0xFF0A0A0A);
  static const muted = Color(0xFF7B7B7B);
  static const redu = Color(0x4FD5D5D5);

}

ThemeData buildAppTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    ),
  );
}
