// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color errorContainer;
  final Color surface;
  final Color tertiary;
  final Color neutral;
  final Color textPrimary;
  final Color textSecondary;
  final Color textError;
  final Color textPlaceHolder;
  final Color iconInactive;
  final Color iconActive;
  final Color iconActiveBackground;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.errorContainer,
    required this.surface,
    required this.tertiary,
    required this.neutral,
    required this.textPrimary,
    required this.textSecondary,
    required this.textError,
    required this.textPlaceHolder,
    required this.iconActive,
    required this.iconInactive,
    required this.iconActiveBackground,
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? errorContainer,
    Color? surface,
    Color? neutral,
    Color? tertiary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textError,
    Color? textPlaceHolder,
    Color? iconInactive,
    Color? iconActive,
    Color? iconActiveBackground,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      errorContainer: errorContainer ?? this.errorContainer,
      surface: surface ?? this.surface,
      neutral: neutral ?? this.neutral,
      tertiary: tertiary ?? this.tertiary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textError: textError ?? this.textError,
      textPlaceHolder: textPlaceHolder ?? this.textPlaceHolder,
      iconInactive: iconInactive ?? this.iconInactive,
      iconActive: iconActive ?? this.iconActive,
      iconActiveBackground: iconActiveBackground ?? this.iconActiveBackground,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textError: Color.lerp(textError, other.textError, t)!,
      textPlaceHolder: Color.lerp(textPlaceHolder, other.textPlaceHolder, t)!,
      iconInactive: Color.lerp(iconInactive, other.iconInactive, t)!,
      iconActive: Color.lerp(iconActive, other.iconActive, t)!,
      iconActiveBackground: Color.lerp(
        iconActiveBackground,
        other.iconActiveBackground,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
