import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

class AccountLinksSection extends StatelessWidget {
  const AccountLinksSection({super.key, this.isLoading = false});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Box(height: 60, width: double.infinity, radius: 12);
    }
    return Container(
      decoration: BoxDecoration(
        color: context.colors.neutral,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: context.colors.secondary,
            ),
            title: Text(
              'Account Settings',
              style: context.textStyles.font16TextPrimaryMedium,
            ),
            trailing: Icon(
              Symbols.arrow_forward_ios,
              color: context.colors.primary.withAlpha(50),
              size: 20,
            ),
            onTap: () {
              // TODO:: Navigate to account settings screen
            },
          ),
        ],
      ),
    );
  }
}
