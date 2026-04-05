import 'package:donor_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.buttonText,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    required this.textStyle,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    required this.onPressed,
  });
  final String buttonText;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final double? borderRadius;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 20.w,
            vertical: verticalPadding ?? 0.h,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? context.colors.primary,
        ),

        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          ),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 68.h),
        ),
      ),
      child: Text(buttonText, style: textStyle),
    );
  }
}
