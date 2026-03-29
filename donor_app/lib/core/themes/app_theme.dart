import 'package:donor_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme() {
  final colors = AppColors.light();
  return ThemeData(
    scaffoldBackgroundColor: colors.background,
    brightness: Brightness.light,
    extensions: [AppColors.light()],
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colors.surface,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      prefixIconConstraints: BoxConstraints(
        maxHeight: 40.h,
        maxWidth: 40.w,
        minHeight: 30.h,
        minWidth: 30.w,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.textError, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.secondary, width: 2),
      ),
    ),
  );
}

ThemeData darkTheme() {
  final colors = AppColors.dark();
  return ThemeData(
    scaffoldBackgroundColor: colors.background,
    brightness: Brightness.dark,
    extensions: [AppColors.dark()],
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colors.surface,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      prefixIconConstraints: BoxConstraints(
        maxHeight: 40.h,
        maxWidth: 40.w,
        minHeight: 30.h,
        minWidth: 30.w,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.textError, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.secondary, width: 2),
      ),
    ),
  );
}
