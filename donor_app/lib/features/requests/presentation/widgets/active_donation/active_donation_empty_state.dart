import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveDonationEmptyState extends StatelessWidget {
  const ActiveDonationEmptyState({super.key, required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 0.74.sh),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96.w,
              height: 96.w,
              decoration: BoxDecoration(
                color: context.colors.iconActiveBackground.withAlpha(120),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.volunteer_activism_outlined,
                color: context.colors.primary,
                size: 42.sp,
              ),
            ),
            verticalSpace(24),
            Text(
              context.localizations.no_active_donation_found,
              textAlign: TextAlign.center,
              style: context.textStyles.font24TextPrimaryBold,
            ),
            verticalSpace(10),
            Text(
              context.localizations.active_donation_empty_message,
              textAlign: TextAlign.center,
              style: context.textStyles.font14TextPlaceHolderRegular,
            ),
            verticalSpace(28),
            AppElevatedButton(
              isLoading: false,
              onPressed: onRefresh,
              title: context.localizations.active_donation_empty_action,
            ),
          ],
        ),
      ),
    );
  }
}
