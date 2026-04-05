import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:donor_app/features/onboarding/widgets/onboarding_header.dart';
import 'package:donor_app/features/onboarding/widgets/onboarding_model.dart';
import 'package:donor_app/features/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();
  final ValueNotifier pageIndexNotifier = ValueNotifier(0);
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  List<OnboardingModel> get onboardingData => [
    OnboardingModel(
      imageDark: ImagePaths.onboarding1Dark,
      imageLight: ImagePaths.onboarding1Light,
      title: localizations.onboarding_title_1,
      subtitle: localizations.onboarding_subtitle_1,
    ),
    OnboardingModel(
      imageDark: ImagePaths.onboarding2Dark,
      imageLight: ImagePaths.onboarding2Light,
      title: localizations.onboarding_title_2,
      subtitle: localizations.onboarding_subtitle_2,
    ),
    OnboardingModel(
      imageDark: ImagePaths.onboarding3Dark,
      imageLight: ImagePaths.onboarding3Light,
      title: localizations.onboarding_title_3_part_1,
      subtitle: localizations.onboarding_subtitle_3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
          child: Column(
            children: [
              const OnboardingHeader(),
              verticalSpace(100),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (i) => pageIndexNotifier.value = i,
                  children: List.generate(3, (index) {
                    final item = onboardingData[index];
                    return OnboardingScreen(
                      image: context.isDarkMode
                          ? item.imageDark
                          : item.imageLight,
                      title: item.title,
                      subtitle: item.subtitle,
                      index: index,
                    );
                  }),
                ),
              ),
              verticalSpace(46),
              ValueListenableBuilder(
                valueListenable: pageIndexNotifier,
                builder: (context, index, child) {
                  return OnboardingPageIndicator(currentIndex: index);
                },
              ),
              verticalSpace(12),
              ValueListenableBuilder(
                valueListenable: pageIndexNotifier,
                builder: (context, index, child) {
                  return AppTextButton(
                    buttonText: index == 2
                        ? localizations.get_started
                        : localizations.next,
                    textStyle: context.textStyles.font18TextPrimaryBold,
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  );
                },
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
