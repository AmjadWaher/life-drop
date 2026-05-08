import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_state.dart';
import 'package:donor_app/features/requests/presentation/widgets/action_buttons_section.dart';
import 'package:donor_app/features/requests/presentation/widgets/active_donation_loading_screen.dart';
import 'package:donor_app/features/requests/presentation/widgets/expiration_countdown_card.dart';
import 'package:donor_app/features/requests/presentation/widgets/help_support_footer.dart';
import 'package:donor_app/features/requests/presentation/widgets/hospital_summary_card.dart';
import 'package:donor_app/features/requests/presentation/widgets/map_bento_card.dart';
import 'package:donor_app/features/requests/presentation/widgets/status_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveDonationScreen extends StatelessWidget {
  const ActiveDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 20.h,
              bottom: 20.h,
            ),
            child: BlocBuilder<ActiveDonationCubit, ActiveDonationState>(
              builder: (context, state) {
                if (state is ActiveDonationSuccess) {
                  final donation = state.donation;
                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      const StatusHeaderSection(),
                      verticalSpace(8),
                      MapBentoCard(
                        hospitalLat: donation.hospitalLatitude.toDouble(),
                        hospitalLng: donation.hospitalLongitude.toDouble(),
                      ),
                      verticalSpace(32),
                      const ActionButtonsSection(),
                      verticalSpace(32),
                      ExpirationCountdownCard(
                        totalMinutes: donation.remainingMinutes,
                      ),
                      verticalSpace(32),
                      HospitalSummaryCard(
                        bloodType: donation.requiredBloodType,
                        hospitalLatitude: donation.hospitalLatitude,
                        hospitalLongitude: donation.hospitalLongitude,
                        hospitalName: donation.hospitalName,
                        unitsRequested: donation.unitsRequested,
                        urgency: donation.urgency,
                      ),
                      verticalSpace(32),
                      const HelpSupportFooter(),
                    ],
                  );
                } else if (state is ActiveDonationEmpty) {
                  return const Center(
                    child: Text('Not Found Active Donation Now.'),
                  );
                } else if (state is ActiveDonationError) {
                  return Center(child: Text(state.error.getAllErrorMessages()));
                } else {
                  return const ActiveDonationLoadingScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
