import 'package:donor_app/core/enums/blood_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:donor_app/features/home/presentation/widgets/blood_type_badge.dart';
import 'package:donor_app/features/home/presentation/widgets/urgency_indicator.dart';

class DonationRequestCard extends StatelessWidget {
  const DonationRequestCard({
    super.key,
    required this.bloodType,
    required this.urgencyStatus,
    required this.hospitalName,
    required this.onPressed,
    this.buttonStyle,
    this.isUrgent = true,
  });
  final BloodType bloodType;
  final String urgencyStatus;
  final String hospitalName;
  final TextStyle? buttonStyle;
  final bool isUrgent;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.navigationBar,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              BloodTypeBadge(bloodType: bloodType.label, isUrgent: isUrgent),
              const Spacer(),
              UrgencyIndicator(
                urgencyStatus: urgencyStatus.toUpperCase(),
                statusStyle: isUrgent
                    ? context.textStyles.font10PrimaryBold.copyWith(
                        letterSpacing: 0.5,
                      )
                    : context.textStyles.font10SecondaryBold.copyWith(
                        letterSpacing: 1.5,
                      ),
              ),
            ],
          ),
          verticalSpace(15),
          Text(hospitalName, style: context.textStyles.font18TextPrimaryBold),
          verticalSpace(20),
          AppElevatedButton(
            isLoading: false,
            onPressed: onPressed,
            style: isUrgent ? null : context.textStyles.font16SecondaryBold,
            buttonColors: isUrgent ? null : context.colors.tertiary,
            title: context.localizations.response_now_button,
          ),
        ],
      ),
    );
  }
}
