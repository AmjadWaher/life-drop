import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/splash/presentation/widgets/linear_loading.dart';
import 'package:donor_app/features/splash/presentation/widgets/loading_text.dart';
import 'package:donor_app/features/splash/presentation/widgets/splash_logo_circle.dart';
import 'package:donor_app/features/splash/presentation/widgets/tagline_text.dart';
import 'package:donor_app/features/splash/presentation/widgets/version_footer_with_motto_text.dart';
import 'package:donor_app/features/splash/presentation/widgets/wordmark_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            verticalSpace(220),
            const SplashLogoCircle(),
            verticalSpace(48),
            const WordmarkText(),
            verticalSpace(12),
            const TaglineText(),
            verticalSpace(197),
            const LinearLoading(),
            verticalSpace(12),
            const LoadingText(),
            const Spacer(),
            const VersionFooterWithMottoText(),
          ],
        ),
      ),
    );
  }
}
