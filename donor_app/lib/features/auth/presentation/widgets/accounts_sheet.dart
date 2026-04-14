import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/auth/domain/params/account.dart';
import 'package:donor_app/features/auth/presentation/widgets/account_tile.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AccountsSheet extends StatelessWidget {
  const AccountsSheet({super.key, required this.accounts, required this.onTap});
  final List<Account> accounts;
  final void Function(String, String) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.accounts,
            style: context.textStyles.font16TextPrimaryBold,
          ),
          verticalSpace(10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final account = accounts[index];
              return AccountTile(
                email: account.email,
                onTap: () {
                  onTap(account.email, account.password);
                },
              );
            },
            separatorBuilder: (context, index) => verticalSpace(10),
            itemCount: accounts.length,
          ),
        ],
      ),
    );
  }
}
