import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/features/home/presentation/widgets/biometric_sheet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return const Scaffold(body: Center(child: Text('Home Screen')));
  }
}
