import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TaglineText extends StatelessWidget {
  const TaglineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.app_tagline,
      style: context.textStyles.font14SecondaryBold.copyWith(
        letterSpacing: 2.8,
      ),
    );
  }
}
