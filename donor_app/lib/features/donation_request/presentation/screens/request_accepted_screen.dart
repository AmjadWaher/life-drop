import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/location_helper.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_elevated_button.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/destination_card.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/success_icon.dart';
import 'package:donor_app/features/donation_request/presentation/widgets/success_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestAcceptedScreen extends StatelessWidget {
  const RequestAcceptedScreen({
    super.key,
    required this.hospitalLatitude,
    required this.hospitalLongitude,
  });

  final double hospitalLatitude;
  final double hospitalLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: .centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.close,
                  size: 28,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            verticalSpace(8),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    bottom: 24.h,
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      const SuccessIcon(),
                      verticalSpace(8),
                      const SuccessTextSection(),
                      verticalSpace(35),
                      DestinationCard(
                        lat: hospitalLatitude,
                        lng: hospitalLongitude,
                      ),
                      verticalSpace(32),
                      AppElevatedButton(
                        isLoading: false,
                        onPressed: () {
                          LocationHelper.openDirections(
                            hospitalLatitude,
                            hospitalLongitude,
                          );
                        },
                        title: context.localizations.start_navigation,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
