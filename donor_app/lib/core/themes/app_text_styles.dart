import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // ------------ 10 sp ------------
  static TextStyle font10TextSecondaryRegular(BuildContext context) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.regular,
      color: context.colors.textSecondary,
    );
  }

  static TextStyle font10TextSecondaryRegular60Faded(BuildContext context) =>
      TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeightHelper.regular,
        color: context.colors.textSecondary.withAlpha(153),
      );

  static TextStyle font10SecondaryBold(BuildContext context) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.secondary,
  );
  static TextStyle font10TextPlaceHolderBold40Faded(BuildContext context) =>
      TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeightHelper.bold,
        color: context.colors.textPlaceHolder.withAlpha(102),
      );
  static TextStyle font10TextPlaceHolderBold(BuildContext context) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textPlaceHolder,
  );
  static TextStyle font10IconActiveBold(BuildContext context) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.iconActive,
  );
  static TextStyle font10IconInactiveBold(BuildContext context) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.iconInactive,
  );
  static TextStyle font10PrimaryBold(BuildContext context) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.primary,
  );

  // ------------ 12 sp ------------

  static TextStyle font12TextSecondaryRegular(BuildContext context) =>
      TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: context.colors.textSecondary,
      );
  static TextStyle font12TextPlaceHolderRegular(BuildContext context) =>
      TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: context.colors.textPlaceHolder,
      );
  static TextStyle font12TextPlaceHolderMedium(BuildContext context) =>
      TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: context.colors.textPlaceHolder,
      );
  static TextStyle font12SecondarySemiBold(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: context.colors.secondary,
  );
  static TextStyle font12SecondaryBold(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.secondary,
  );
  static TextStyle font12TextErrorBold(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textError,
  );

  // ------------ 14 sp ------------

  static TextStyle font14SecondaryBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.secondary,
  );
  static TextStyle font14PrimaryBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.primary,
  );
  static TextStyle font14PrimaryRegular(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.primary,
  );
  static TextStyle font14WhiteBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font14SecondarySemiBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: context.colors.secondary,
  );
  static TextStyle font14SecondaryMedium(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.secondary,
  );
  static TextStyle font14TextSecondaryRegular(BuildContext context) =>
      TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: context.colors.textSecondary,
      );
  static TextStyle font14TextPlaceHolderRegular(BuildContext context) =>
      TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: context.colors.textPlaceHolder,
      );
  static TextStyle font14TextPrimaryRegular(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.textPrimary,
  );
  static TextStyle font14TextPrimaryBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textPrimary,
  );

  // ------------ 16 sp ------------

  static TextStyle font16SecondaryMedium(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.secondary,
  );
  static TextStyle font16TextPlaceHolderMedium50Faded(BuildContext context) =>
      TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        color: context.colors.textPlaceHolder.withAlpha(125),
      );
  static TextStyle font16SecondaryBold(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.secondary,
  );
  static TextStyle font16WhiteBold(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  // ------------ 18 sp ------------

  static TextStyle font18WhiteBold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font18TextPrimaryBold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textPrimary,
  );

  // ------------ 20 sp ------------

  static TextStyle font20TextPrimaryBold(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textPrimary,
  );

  // ------------ 24 sp ------------

  static TextStyle font24TextPrimaryBold(BuildContext context) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.textPrimary,
  );
  static TextStyle font24PrimaryExtraBold(BuildContext context) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: context.colors.primary,
  );

  // ------------ 30 sp ------------

  static TextStyle font30TextPrimaryExtraBold(BuildContext context) =>
      TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeightHelper.extraBold,
        color: context.colors.textPrimary,
      );

  // ------------ 36 sp ------------

  static TextStyle font36TextPrimaryExtraBold(BuildContext context) =>
      TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeightHelper.extraBold,
        color: context.colors.textPrimary,
      );

  // ------------ 48 sp ------------

  static TextStyle font48PrimaryExtraBold(BuildContext context) => TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: context.colors.primary,
  );
  static TextStyle font48TextPrimaryExtraBold(BuildContext context) =>
      TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeightHelper.extraBold,
        color: context.colors.textPrimary,
      );
}
