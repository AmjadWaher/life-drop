import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsSection extends StatelessWidget {
  const RequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.active_requests,
          style: context.textStyles.font24TextPrimaryBold,
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? context.colors.iconActiveBackground.withAlpha(51)
                : context.colors.iconActiveBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          child: Text(
            AppLocalizations.of(context)!.urgent_priority,
            style: context.textStyles.font10PrimaryBold,
          ),
        ),
      ],
    );
  }
}
