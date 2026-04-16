import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/widgets/app_header.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/features/home/presentation/widgets/biometric_sheet.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_summary.dart';
import 'package:donor_app/features/home/presentation/widgets/greeting_section.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_request_card.dart';
import 'package:donor_app/features/home/presentation/widgets/request_cards_list.dart';
import 'package:donor_app/features/home/presentation/widgets/requests_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final activeCards = [
    const DonationRequestCard(
      bloodType: 'O+',
      urgencyStatus: 'HIGHT URGENCY',
      distanceAway: '2.4 Km away',
      hospitalName: 'St. Jude Medical',
      description: 'Emergency surgery requirement. Needs 3 units by tonight',
      buttonTitle: 'Response Now',
    ),
    const DonationRequestCard(
      bloodType: 'B-',
      urgencyStatus: 'Scheduled',
      distanceAway: '5.1 Km away',
      hospitalName: 'City Blood Bank',
      description:
          'Rare type inventory replenishment. Donor needed for Friday.',
      buttonTitle: 'Schedule Appointment',
      isUrgent: false,
    ),
  ];
  void showBiometricPrompt() async {
    if (!await SharedPrefHelper.getBool(SharedPrefKeys.biometricEnabled)) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            backgroundColor: context.colors.background,
            builder: (context) => const BiometricSheet(),
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showBiometricPrompt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppHeader(
                  icon: const AppImages(
                    path: ImagePaths.logo,
                    type: ImageType.svg,
                    width: 16,
                    height: 20,
                  ),
                  title: AppLocalizations.of(context)!.life_drop,
                  style: context.textStyles.font20PrimaryExtraBold,
                ),
                verticalSpace(15),
                const GreetingSection(),
                verticalSpace(18),
                const DonationSummary(totalDonations: '12'),
                verticalSpace(38),
                const RequestsSection(),
                verticalSpace(24),
                RequestCardsList(cards: activeCards),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
