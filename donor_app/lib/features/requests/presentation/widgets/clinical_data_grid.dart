import 'package:donor_app/core/enums/blood_type.dart';
import 'package:donor_app/core/enums/urgency_status.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/requests/presentation/widgets/clinical_data_cell.dart';
import 'package:flutter/material.dart';

class ClinicalDataGrid extends StatelessWidget {
  const ClinicalDataGrid({
    super.key,
    required this.bloodType,
    required this.unitsRequested,
    required this.urgency,
  });
  final BloodType bloodType;
  final int unitsRequested;
  final UrgencyStatus urgency;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              ClinicalDataCell(
                label: 'BLOOD TYPE',
                icon: Icons.water_drop_outlined,
                value: bloodType.label,
              ),
              verticalSpace(16),
              ClinicalDataCell(
                label: 'UNITS REQUESTED',
                icon: Icons.science_outlined,
                value: '$unitsRequested Units',
              ),
            ],
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            children: [
              ClinicalDataCell(
                label: 'PRIORITY',
                icon: Icons.priority_high,
                value: urgency.name,
                valueColor: context.colors.primary,
              ),
              verticalSpace(16),
              const ClinicalDataCell(
                label: 'IMPACT',
                icon: Icons.favorite_border,
                value: 'Saves 3 Lives',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
