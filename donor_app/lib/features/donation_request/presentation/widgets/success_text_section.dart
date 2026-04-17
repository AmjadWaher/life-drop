import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SuccessTextSection extends StatelessWidget {
  const SuccessTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.you_are_a_lifesaver,
          style: context.textStyles.font36TextPrimaryExtraBold.copyWith(
            letterSpacing: -0.9,
          ),
        ),
        verticalSpace(12),
        Text(
          AppLocalizations.of(context)!.request_accepted_hospital_waiting,
          style: context.textStyles.font16SecondaryMedium.copyWith(
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
