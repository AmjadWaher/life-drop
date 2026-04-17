import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/home/domain/param/donation_request_param.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';

class RequestCardsList extends StatelessWidget {
  const RequestCardsList({super.key, required this.requests});

  final List<DonationRequestParam> requests;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // TODO:: Make it 5
      itemBuilder: (context, index) {
        final request = requests[index];
        return DonationRequestCard(
          bloodType: request.bloodType,
          urgencyStatus: request.urgencyStatus,
          distanceAway: request.distanceAway,
          hospitalName: request.hospitalName,
          description: request.description,
          buttonTitle: request.urgencyStatus.toLowerCase() != 'scheduled'
              ? 'Response Now'
              : 'Schedule Appointment',
          isUrgent: request.urgencyStatus.toLowerCase() != 'scheduled',
          onPressed: () {
            context.pushNamed(Routes.requestDetails);
          },
        );
      },

      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
