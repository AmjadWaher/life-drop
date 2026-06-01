import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiErrorScreen extends StatelessWidget {
  const ApiErrorScreen({super.key, required this.error, this.onRetry});

  final ApiErrorModel error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 420.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 88.w,
                height: 88.w,
                decoration: BoxDecoration(
                  color: context.colors.iconActiveBackground.withAlpha(120),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.cloud_off_outlined,
                  color: context.colors.primary,
                  size: 40.sp,
                ),
              ),
              verticalSpace(22),
              Text(
                context.localizations.api_error_title,
                textAlign: TextAlign.center,
                style: context.textStyles.font24TextPrimaryBold,
              ),
              verticalSpace(10),
              Text(
                context.localizations.api_error_message,
                textAlign: TextAlign.center,
                style: context.textStyles.font14TextPlaceHolderRegular,
              ),
              verticalSpace(14),
              Text(
                error.getAllErrorMessages(),
                textAlign: TextAlign.center,
                style: context.textStyles.font14TextPrimaryRegular,
              ),
              if (onRetry != null) ...[
                verticalSpace(28),
                AppElevatedButton(
                  isLoading: false,
                  onPressed: onRetry!,
                  title: context.localizations.retry,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
