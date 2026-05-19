import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onLogoutPressed});

  final VoidCallback onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        AppTextButton(
          buttonText: context.localizations.logout,
          textStyle: context.textStyles.font16WhiteBold,
          onPressed: onLogoutPressed,
        ),
        verticalSpace(24),
        _buildFooterText(context),
      ],
    );
  }

  Widget _buildFooterText(BuildContext context) {
    return Text(
      context.localizations.app_footer,
      style: context.textStyles.font10TextSecondaryRegular60Faded.copyWith(
        letterSpacing: 2,
      ),
    );
  }
}
