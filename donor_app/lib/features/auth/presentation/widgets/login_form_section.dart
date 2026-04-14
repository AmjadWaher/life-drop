import 'package:donor_app/core/helpers/account_storage_helper.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/features/auth/presentation/widgets/accounts_sheet.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final passwordNotifier = ValueNotifier(true);

  AppLocalizations get localizations => AppLocalizations.of(context)!;

  void _autoFillFields() async {
    final accounts = await AccountStorageHelper().getAccounts();

    if (!mounted) return;

    if (accounts.isNotEmpty) {
      FocusScope.of(context).unfocus();
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: context.colors.background,
        builder: (context) {
          return AccountsSheet(
            accounts: accounts,
            onTap: (email, password) {
              widget.emailController.text = email;
              widget.passwordController.text = password;
              context.pop();
              FocusScope.of(context).unfocus();
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    passwordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        AuthTextField(
          controller: widget.emailController,
          title: localizations.email,
          titleStyle: context.textStyles.font12SecondaryBold,
          hintText: 'donor@pulse.com',
          prefixIcon: AppImages(
            path: ImagePaths.atSign,
            type: ImageType.svg,
            color: context.colors.textPlaceHolder,
          ),
          hintTextStyle: context.textStyles.font16TextPlaceHolderMedium50Faded,
          onTap: () {
            if (widget.emailController.text.isEmpty) {
              Future.delayed(const Duration(milliseconds: 300), () {
                FocusScope.of(context).unfocus();
                _autoFillFields();
              });
            }
          },
        ),
        verticalSpace(24),
        ValueListenableBuilder(
          valueListenable: passwordNotifier,
          builder: (context, value, child) {
            return AuthTextField(
              obscureText: value,
              controller: widget.passwordController,
              title: localizations.password,
              titleStyle: context.textStyles.font12SecondaryBold,
              hintText: '••••••••',
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: context.colors.textPlaceHolder,
              ),
              suffixIcon: GestureDetector(
                onTap: () => passwordNotifier.value = !passwordNotifier.value,
                child: Icon(
                  value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: context.colors.textPlaceHolder,
                ),
              ),
              hintTextStyle:
                  context.textStyles.font16TextPlaceHolderMedium50Faded,
            );
          },
        ),
        verticalSpace(12),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.forgotPassword);
            },
            child: Text(
              localizations.forgot_password,
              style: context.textStyles.font12SecondarySemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
