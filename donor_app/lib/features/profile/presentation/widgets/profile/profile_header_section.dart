import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key, required this.isVerified});
  final bool? isVerified;

  @override
  Widget build(BuildContext context) {
    if (isVerified == null) {
      return Column(
        crossAxisAlignment: .start,
        children: [
          const Box(height: 30, width: 170),
          verticalSpace(5),
          const Box(height: 35, width: 270),
          verticalSpace(5),
          const Box(height: 35, width: double.infinity, radius: 12),
        ],
      );
    }
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'My Profile',
          style: context.textStyles.font36TextPrimaryExtraBold.copyWith(
            letterSpacing: -0.9,
          ),
        ),
        verticalSpace(8),
        Text(
          'Manage your donor identity and impact history.',
          style: context.textStyles.font16SecondaryMedium,
        ),
        verticalSpace(10),

        Container(
          decoration: BoxDecoration(
            color: context.colors.tertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              TwoToneIcon.varied(
                isVerified! ? Symbols.verified : Symbols.verified_off,
                color: context.colors.tertiary,
                color2: context.colors.secondary,
              ),
              horizontalSpace(12),
              Text(
                isVerified! ? 'Verified' : 'Unverified',
                style: context.textStyles.font14TextPrimaryBold.copyWith(
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
