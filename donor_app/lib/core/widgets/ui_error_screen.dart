import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiErrorScreen extends StatelessWidget {
  const UiErrorScreen({super.key, this.details});

  final FlutterErrorDetails? details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 88.r,
                    width: 88.r,
                    decoration: BoxDecoration(
                      color: context.colors.iconActiveBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: context.colors.primary,
                      size: 44.r,
                    ),
                  ),
                  verticalSpace(24),
                  Text(
                    context.localizations.ui_error_title,
                    textAlign: TextAlign.center,
                    style: context.textStyles.font24TextPrimaryBold,
                  ),
                  verticalSpace(12),
                  Text(
                    context.localizations.ui_error_message,
                    textAlign: TextAlign.center,
                    style: context.textStyles.font14TextSecondaryRegular,
                  ),
                  if (kDebugMode && details != null) ...[
                    verticalSpace(20),
                    _DebugErrorDetails(details: details!),
                  ],
                  verticalSpace(28),
                  AppElevatedButton(
                    isLoading: false,
                    onPressed: _goToSafeStart,
                    title: context.localizations.ui_error_action,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToSafeStart() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.splash,
      (route) => false,
    );
  }
}

class _DebugErrorDetails extends StatelessWidget {
  const _DebugErrorDetails({required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.colors.neutral,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        details.exceptionAsString(),
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.font12TextSecondaryMedium,
      ),
    );
  }
}
