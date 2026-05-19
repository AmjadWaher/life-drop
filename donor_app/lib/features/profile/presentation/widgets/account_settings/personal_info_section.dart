import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/profile/presentation/widgets/section_header.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/settings_list_tile.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/verified_badge.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key, required this.isVerified});
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: context.localizations.personal_information_label),
        verticalSpace(10),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colors.neutral,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SettingsListTile(
                icon: Symbols.person_edit,
                title: context.localizations.edit_profile,
                onTap: () {
                  // TODO: Navigate to edit profile
                },
              ),
              SettingsListTile(
                icon: Symbols.verified_user,
                title: context.localizations.verification_status,
                showDivider: true,
                trailing: VerifiedBadge(isVerified: isVerified),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
