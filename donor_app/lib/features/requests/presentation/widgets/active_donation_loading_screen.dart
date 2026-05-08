import 'package:donor_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ActiveDonationLoadingScreen extends StatelessWidget {
  const ActiveDonationLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _box(height: 50, width: 180),
            verticalSpace(32),

            // Map card
            _box(height: 190, width: double.infinity, radius: 16),
            verticalSpace(28),

            // Buttons
            _box(height: 64, width: double.infinity, radius: 12),
            verticalSpace(12),
            _box(height: 64, width: double.infinity, radius: 12),
            verticalSpace(28),

            // Timer card
            _box(height: 210, width: double.infinity, radius: 16),
            verticalSpace(28),

            // Info card
            _box(height: 310, width: double.infinity, radius: 16),
          ],
        ),
      ),
    );
  }

  Widget _box({
    required double height,
    required double width,
    double radius = 8,
  }) {
    return Container(
      height: height,
      width: width == double.infinity ? double.infinity : width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
