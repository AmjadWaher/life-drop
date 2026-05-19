import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/profile/domain/entities/user_entity.dart';
import 'package:donor_app/features/profile/presentation/logic/profile/profile_cubit.dart';
import 'package:donor_app/features/profile/presentation/logic/profile/profile_state.dart';
import 'package:donor_app/features/profile/presentation/widgets/profile/account_links_section.dart';
import 'package:donor_app/features/profile/presentation/widgets/profile/cooldown_card.dart';
import 'package:donor_app/features/profile/presentation/widgets/profile/identity_sub_grid.dart';
import 'package:donor_app/features/profile/presentation/widgets/profile/profile_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Shimmer.fromColors(
                    baseColor: Colors.white.withAlpha(150),
                    highlightColor: Colors.white70,
                    direction: context.isArabic
                        ? ShimmerDirection.rtl
                        : ShimmerDirection.ltr,
                    child: _buildProfileContent(null),
                  ),
                  success: (user) => _buildProfileContent(user),
                  updating: (user) => _buildProfileContent(user),
                  updateSuccess: (user, response) => _buildProfileContent(user),
                  error: (error) =>
                      Center(child: Text(error.getAllErrorMessages())),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(UserEntity? user) {
    return Column(
      children: [
        ProfileHeaderSection(
          isVerified: user?.isMedicallyVerified,
          firstName: user?.firstName,
          lastName: user?.lastName,
          bloodType: user?.bloodType,
        ),
        verticalSpace(28),
        const CooldownCard(),
        verticalSpace(24),
        IdentitySubGrid(
          bloodType: user?.bloodType,
          totalDonations: user?.totalDonations,
        ),
        verticalSpace(24),
        AccountLinksSection(isVerified: user?.isMedicallyVerified),
      ],
    );
  }
}
