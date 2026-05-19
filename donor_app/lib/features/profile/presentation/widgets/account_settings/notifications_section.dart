import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/profile/presentation/widgets/section_header.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/settings_list_tile.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/settings_toggle_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({
    super.key,
    required this.notificationEnabled,
    required this.onNotificationChanged,
  });
  final bool notificationEnabled;
  final void Function(bool value) onNotificationChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: context.localizations.notifications_label),
        verticalSpace(10),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colors.neutral,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SettingsToggleTile(
                icon: Symbols.notifications_active,
                title: context.localizations.push_notifications,
                isSelected: notificationEnabled,
                onChanged: onNotificationChanged,
              ),
              SettingsListTile(
                icon: Symbols.mail,
                title: context.localizations.email_alerts,
                showDivider: true,
                onTap: () {
                  // TODO: Navigate to email alerts settings
                },
              ),
              SettingsListTile(
                icon: Symbols.sms,
                title: context.localizations.sms_alerts,
                showDivider: true,
                onTap: () {
                  // TODO: Navigate to SMS alerts settings
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
