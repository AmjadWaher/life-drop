import 'package:donor_app/core/enums/blood_type.dart';
import 'package:donor_app/core/enums/urgency_status.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/requests/presentation/widgets/clinical_data_grid.dart';
import 'package:donor_app/features/requests/presentation/widgets/donation_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HospitalSummaryCard extends StatelessWidget {
  const HospitalSummaryCard({
    super.key,
    required this.bloodType,
    required this.hospitalLatitude,
    required this.hospitalLongitude,
    required this.hospitalName,
    required this.unitsRequested,
    required this.urgency,
  });
  final String hospitalName;
  final BloodType bloodType;
  final double hospitalLatitude;
  final double hospitalLongitude;
  final int unitsRequested;
  final UrgencyStatus urgency;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: context.colors.neutral,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DonationHeader(
            hospitalLatitude: hospitalLatitude,
            hospitalLongitude: hospitalLongitude,
            hospitalName: hospitalName,
          ),
          verticalSpace(10),
          Divider(color: context.colors.primary.withAlpha(25), height: 1),
          verticalSpace(15),
          ClinicalDataGrid(
            bloodType: bloodType,
            unitsRequested: unitsRequested,
            urgency: urgency,
          ),
        ],
      ),
    );
  }
}
