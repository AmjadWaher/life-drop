import 'package:donor_app/core/themes/app_colors.dart';
import 'package:donor_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

extension TextStyleExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles(colors);
}

extension ModeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension Validations on String {
  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z0-9_]+@[a-zA-Z0-9]+\.[a-zA-Z]+$').hasMatch(this);

  bool get isValidPassword => RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9])(?=\S+$).{8,}$',
  ).hasMatch(this);
}
