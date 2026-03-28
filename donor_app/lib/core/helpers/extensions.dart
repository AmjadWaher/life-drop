import 'package:donor_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.light();
}
