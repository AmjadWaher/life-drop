import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class HorizontalField extends StatelessWidget {
  const HorizontalField({
    super.key,
    required this.firstController,
    required this.secondController,
    required this.secondHintText,
    required this.secondTitle,
    required this.firstHintText,
    required this.firstTitle,
    this.firstObscureText = false,
    this.secondObscureText = false,
    required this.firstPrefixIcon,
    this.firstSuffixIcon,
    required this.secondPrefixIcon,
    this.secondSuffixIcon,
  });
  final String firstTitle;
  final String firstHintText;
  final String secondTitle;
  final String secondHintText;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final bool firstObscureText;
  final bool secondObscureText;
  final Widget firstPrefixIcon;
  final Widget? firstSuffixIcon;
  final Widget secondPrefixIcon;
  final Widget? secondSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthTextField(
            obscureText: firstObscureText,
            controller: firstController,
            title: firstTitle,
            titleStyle: context.textStyles.font12SecondaryBold,
            hintText: firstHintText,
            prefixIcon: firstPrefixIcon,
            suffixIcon: firstSuffixIcon,
            hintTextStyle:
                context.textStyles.font16TextPlaceHolderMedium50Faded,
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: AuthTextField(
            obscureText: secondObscureText,
            title: secondTitle,
            titleStyle: context.textStyles.font12SecondaryBold,
            controller: secondController,
            hintText: secondHintText,
            prefixIcon: secondPrefixIcon,
            suffixIcon: secondSuffixIcon,
            hintTextStyle:
                context.textStyles.font16TextPlaceHolderMedium50Faded,
          ),
        ),
      ],
    );
  }
}
