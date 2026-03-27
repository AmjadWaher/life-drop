import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: context.colors.background,
    brightness: Brightness.light,
    extensions: [lightColors],
    inputDecorationTheme: InputDecorationTheme(
      fillColor: context.colors.surface,
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
        borderSide: BorderSide(color: context.colors.textError, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: context.colors.secondary, width: 2),
      ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: context.colors.background,
    brightness: Brightness.dark,
    extensions: [darkColors],
    inputDecorationTheme: InputDecorationTheme(
      fillColor: context.colors.surface,
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
        borderSide: BorderSide(color: context.colors.textError, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: context.colors.secondary, width: 2),
      ),
    ),
  );
}
