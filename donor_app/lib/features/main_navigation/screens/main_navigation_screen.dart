import 'package:donor_app/features/home/presentation/screens/home_screen.dart';
import 'package:donor_app/features/main_navigation/widgets/custom_navigation_bar.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/profile/presentation/logic/cooldown/cooldown_cubit.dart';
import 'package:donor_app/features/profile/presentation/logic/profile/profile_cubit.dart';
import 'package:donor_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/screens/active_donation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final indexNotifier = ValueNotifier(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const ActiveDonationScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _handleNavigationTap(int index) {
    if (index == indexNotifier.value) return;

    indexNotifier.value = index;

    switch (index) {
      case 0:
        context.read<HomeCubit>().loadHome();
        break;
      case 1:
        context.read<ActiveDonationCubit>().getCurrentActiveDonation();
        break;
      case 4:
        context.read<ProfileCubit>().getUserProfile();
        context.read<CooldownCubit>().getCooldownStatus();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: currentIndex,
            onTap: _handleNavigationTap,
          ),
          body: ValueListenableBuilder(
            valueListenable: indexNotifier,
            builder: (context, currentIndex, child) {
              return screens[currentIndex];
            },
          ),
        );
      },
    );
  }
}
