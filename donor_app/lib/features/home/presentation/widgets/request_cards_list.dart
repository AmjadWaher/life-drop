import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/home/presentation/logic/home_state.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCardsList extends StatelessWidget {
  const RequestCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSuccess ||
          current is HomeLoading ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeSuccess) {
          final requests = state.requests;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return DonationRequestCard(
                bloodType: request.bloodType,
                urgencyStatus: request.urgency.name.toUpperCase(),
                distanceAway: '${request.distanceKm} Km away',
                hospitalName: request.hospitalName,
                description: request.description,
                buttonTitle: request.isUrgent
                    ? context.localizations.response_now_button
                    : context.localizations.schedule_appointment_button,
                isUrgent: request.isUrgent,
                onPressed: () {
                  context.pushNamed(Routes.requestDetails);
                },
              );
            },

            separatorBuilder: (context, index) => verticalSpace(16),
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
