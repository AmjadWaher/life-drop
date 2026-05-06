import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/widgets/app_header.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/home/presentation/logic/home_state.dart';
import 'package:donor_app/features/home/presentation/widgets/biometric_sheet.dart';
import 'package:donor_app/features/home/presentation/widgets/donation_summary.dart';
import 'package:donor_app/features/home/presentation/widgets/greeting_section.dart';
import 'package:donor_app/features/home/presentation/widgets/request_cards_list.dart';
import 'package:donor_app/features/home/presentation/widgets/requests_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().checkBiometricPrompt();

    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is HomeBiometricPromptRequired,
      listener: (context, state) {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isDismissible: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: context.colors.background,
          builder: (context) => const BiometricSheet(),
        );
      },
      child: Scaffold(
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
                    title: context.localizations.life_drop,
                    style: context.textStyles.font20PrimaryExtraBold,
                  ),
                  verticalSpace(15),
                  const GreetingSection(),
                  verticalSpace(18),
                  const DonationSummary(totalDonations: 3),
                  verticalSpace(38),
                  const RequestsSection(),
                  verticalSpace(24),
                  const RequestCardsList(),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
