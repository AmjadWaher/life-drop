import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.splash_loading_text,
      textAlign: TextAlign.center,
      style: context.textStyles.font10TextSecondaryRegular.copyWith(
        letterSpacing: 1,
      ),
    );
  }
}
