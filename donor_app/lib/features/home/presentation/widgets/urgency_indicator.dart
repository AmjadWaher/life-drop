import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class UrgencyIndicator extends StatelessWidget {
  const UrgencyIndicator({
    super.key,
    required this.urgencyStatus,
    required this.distanceAway,
    required this.statusStyle,
  });
  final String urgencyStatus;
  final String distanceAway;
  final TextStyle statusStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .end,
      children: [
        Text(urgencyStatus, style: statusStyle),
        verticalSpace(4),
        Text(
          distanceAway,
          style: context.textStyles.font12TextSecondaryMedium.copyWith(
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
