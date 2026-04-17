import 'package:donor_app/core/helpers/map_helper.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/destination_card.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/success_icon.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/success_text_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestAcceptedScreen extends StatelessWidget {
  const RequestAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const SuccessIcon(),
              verticalSpace(8),
              const SuccessTextSection(),
              verticalSpace(35),

              // TODO:: must change lat and lng values to be dynamic
              const DestinationCard(lat: 32.5556, lng: 35.8500),
              verticalSpace(32),
              AppElevatedButton(
                isLoading: false,
                onPressed: () {
                  // TODO:: must change lat and lng values to be dynamic
                  MapHelper.openDirections(32.5556, 35.8500);
                },
                title: AppLocalizations.of(context)!.start_navigation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
