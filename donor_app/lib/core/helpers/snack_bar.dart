import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar snackBar(
  BuildContext context, {
  String? title,
  required String content,
  IconData? icon,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
  Color? iconColor,
}) {
  return SnackBar(
    duration: const Duration(seconds: 4),
    margin: margin,
    padding: padding,
    content: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? context.colors.primary,
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.info_outline,
            color: iconColor ?? Colors.white,
            size: 30,
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(title, style: context.textStyles.font12TextErrorBold),
                if (title != null) verticalSpace(4),
                Text(
                  content,
                  style: context.textStyles.font12TextErrorBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
