import 'package:donor_app/core/enums/blood_type.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/box.dart';
import 'package:donor_app/features/profile/presentation/widgets/profile/identity_info_card.dart';
import 'package:flutter/material.dart';

class IdentitySubGrid extends StatelessWidget {
  const IdentitySubGrid({
    super.key,
    required this.bloodType,
    required this.totalDonations,
  });
  final BloodType? bloodType;
  final int? totalDonations;

  @override
  Widget build(BuildContext context) {
    if (bloodType == null && totalDonations == null) {
      return Row(
        children: [
          const Expanded(
            child: Box(height: 160, width: double.infinity, radius: 12),
          ),
          horizontalSpace(18),
          const Expanded(
            child: Box(height: 160, width: double.infinity, radius: 12),
          ),
        ],
      );
    }
    return Row(
      children: [
        Expanded(
          child: IdentityInfoCard(
            backgroundColor: context.colors.primary.withAlpha(100),
            icon: bloodType!.label,
            iconColor: context.textStyles.font24PrimaryExtraBold,
            title: context.localizations.blood_type_label,
          ),
        ),
        horizontalSpace(24),
        Expanded(
          child: IdentityInfoCard(
            backgroundColor: context.colors.secondary.withAlpha(100),
            icon: totalDonations!.toString(),
            iconColor: context.textStyles.font24SecondaryExtraBold,
            title: context.localizations.donations_label,
          ),
        ),
      ],
    );
  }
}
