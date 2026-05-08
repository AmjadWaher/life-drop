import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          icon: Icon(Icons.phone, color: Colors.white, size: 18.sp),
          buttonText: 'Contact Hospital',
          textStyle: context.textStyles.font16WhiteBold,
          onPressed: () {
            // TODO: Implement contact hospital action
          },
        ),
        verticalSpace(16),
        AppTextButton(
          icon: Icon(
            Icons.cancel_outlined,
            color: context.colors.textSecondary,
            size: 20.sp,
          ),
          buttonText: 'Cancel Donation',
          textStyle: context.textStyles.font16TextSecondaryBold,
          onPressed: () {
            // TODO: Navigate to Cancel Screen
          },
        ),
      ],
    );
  }
}
