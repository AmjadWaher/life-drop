import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/mixins/snack_bar_mixin.dart';
import 'package:donor_app/features/requests/domain/entities/active_donation_entity.dart';
import 'package:donor_app/features/requests/presentation/widgets/donation_certificate/certificate_info_row.dart';
import 'package:donor_app/features/requests/presentation/widgets/donation_certificate/donation_certificate_download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationCertificateCard extends StatelessWidget with SnackBarMixin {
  const DonationCertificateCard({super.key, required this.donation});
  final ActiveDonationEntity donation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: context.colors.neutral,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.primary.withAlpha(45)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Icon(
            Icons.workspace_premium,
            color: context.colors.primary,
            size: 44.sp,
          ),
          verticalSpace(16),
          Text(
            'Donation Certificate',
            style: context.textStyles.font24TextPrimaryBold,
          ),
          verticalSpace(8),
          Text(
            'Thank you for completing your blood donation at ${donation.hospitalName}',
            style: context.textStyles.font14TextSecondaryRegular,
          ),
          verticalSpace(15),
          CertificateInfoRow(
            label: 'Blood Type',
            value: donation.requiredBloodType.label,
          ),
          verticalSpace(10),
          CertificateInfoRow(label: 'Hospital', value: donation.hospitalName),
          verticalSpace(20),
          DonationCertificateDownloadButton(requestId: donation.requestId),
        ],
      ),
    );
  }
}
