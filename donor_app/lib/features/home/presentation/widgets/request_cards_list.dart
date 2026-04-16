import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';

class RequestCardsList extends StatelessWidget {
  const RequestCardsList({super.key, required this.cards});

  // TODO:: Change cards Type to request param
  final List<DonationRequestCard> cards;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // TODO:: Make it 5
      // TODO:: Use DonationRequestCard Widget
      itemBuilder: (context, index) => cards[index],
      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
