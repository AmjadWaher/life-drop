import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_header.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/critical_request_banner.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/donation_progress_card.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/hospital_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key, required this.requestId});
  final String requestId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: 24.w,
            right: 24.w,
            bottom: 5.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                AppHeader(
                  icon: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  title: context.localizations.request_details,
                  style: context.textStyles.font18TextPrimaryBold.copyWith(
                    letterSpacing: -0.45,
                  ),
                ),
                verticalSpace(20),
                const CriticalRequestBanner(
                  requestHeadline: 'Emergency Blood Needed',
                  hospitalName: 'St. Jude Medical',
                  bloodType: 'O-',
                ),
                verticalSpace(15),
                const DonationProgressCard(confirmedDonors: 2, totalDonors: 5),
                verticalSpace(15),
                const HospitalLocationCard(lat: 32.5556, lng: 35.8500),
                verticalSpace(20),
                AppTextButton(
                  buttonText: context.localizations.accept_request,
                  textStyle: context.textStyles.font16WhiteBold,
                  onPressed: () {
                    // TODO:: Navigate to Accepted screen
                    context.pushNamed(Routes.requestAccepted);
                  },
                ),
                verticalSpace(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
