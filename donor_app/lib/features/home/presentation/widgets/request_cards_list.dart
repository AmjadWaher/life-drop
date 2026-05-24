import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/home/domain/entities/donation_request_entity.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/home/presentation/logic/home_state.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Skeletonizer(
            enabled: true,
            child: _buildActiveRequestsList([
              DonationRequestEntity.placeholder(),
            ]),
          ),
          success: (data) => _buildActiveRequestsList(data.activeRequests),
          error: (error) => Center(child: Text(error.getAllErrorMessages())),
          biometricPromptRequired: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildActiveRequestsList(List<DonationRequestEntity> requests) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return DonationRequestCard(
          bloodType: request.bloodType,
          urgencyStatus: request.urgency.name.toUpperCase(),
          hospitalName: request.hospitalName,

          isUrgent: request.isUrgent,
          onPressed: () {
            context.pushNamed(
              Routes.requestDetails,
              arguments: {'requestId': request.requestId},
            );
          },
        );
      },

      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
