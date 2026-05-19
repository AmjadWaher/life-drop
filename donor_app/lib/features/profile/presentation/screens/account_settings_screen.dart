import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/header_sction.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/logout_button.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/notifications_section.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/personal_info_section.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/preferences_section.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/security_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key, required this.isVerified});
  final bool isVerified;

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool _biometricsEnabled = true;
  bool _pushNotificationsEnabled = true;

  void _loadSettings() async {
    final biometricEnabled = await SharedPrefHelper.getBool(
      SharedPrefKeys.biometricEnabled,
    );
    final notificationEnabled = await SharedPrefHelper.getBool(
      SharedPrefKeys.pushNotification,
    );
    setState(() {
      _biometricsEnabled = biometricEnabled;
      _pushNotificationsEnabled = notificationEnabled;
    });
  }

  void _saveSettings(String key, bool value) async {
    await SharedPrefHelper.setData(key, value);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const HeaderSection(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      PersonalInfoSection(isVerified: widget.isVerified),
                      verticalSpace(38),
                      SecuritySection(
                        biometricsEnabled: _biometricsEnabled,
                        onBiometricsChanged: (value) {
                          setState(() {
                            _biometricsEnabled = value;
                          });
                          _saveSettings(SharedPrefKeys.biometricEnabled, value);
                        },
                      ),
                      verticalSpace(38),
                      NotificationsSection(
                        notificationEnabled: _pushNotificationsEnabled,
                        onNotificationChanged: (value) {
                          setState(() {
                            _pushNotificationsEnabled = value;
                          });
                          _saveSettings(SharedPrefKeys.pushNotification, value);
                        },
                      ),
                      verticalSpace(38),
                      const PreferencesSection(),
                      verticalSpace(38),
                      LogoutButton(
                        onLogoutPressed: () {
                          // TODO: Wire to logout action
                        },
                      ),
                      verticalSpace(32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
