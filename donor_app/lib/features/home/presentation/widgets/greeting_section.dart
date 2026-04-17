import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        RichText(
          text: TextSpan(
            text: AppLocalizations.of(context)!.welcome_back_home,
            style: context.textStyles.font30TextPrimaryExtraBold,
            children: [
              TextSpan(
                text: '\nAlex Chen.',
                style: context.textStyles.font30PrimaryExtraBold,
              ),
            ],
          ),
        ),
        verticalSpace(12),
        Text(
          '${AppLocalizations.of(context)!.donation_impact_message('Central General')} ${AppLocalizations.of(context)!.next_donation_availability('14')}',
          style: context.textStyles.font18TextSecondaryRegular,
          maxLines: null,
        ),
      ],
    );
  }
}
