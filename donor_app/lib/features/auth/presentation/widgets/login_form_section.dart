import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_images.dart';
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
          title: AppLocalizations.of(context)!.email,
          titleStyle: context.textStyles.font12SecondaryBold,
          hintText: 'donor@pulse.com',
          prefixIcon: AppImages(
            path: ImagePaths.atSign,
            type: ImageType.svg,
            color: context.colors.textPlaceHolder,
          ),
          hintTextStyle: context.textStyles.font16TextPlaceHolderMedium50Faded,
        ),
        verticalSpace(24),
        ValueListenableBuilder(
          valueListenable: passwordNotifier,
          builder: (context, value, child) {
            return AuthTextField(
              obscureText: value,
              controller: widget.passwordController,
              title: AppLocalizations.of(context)!.password,
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
              AppLocalizations.of(context)!.forgot_password,
              style: context.textStyles.font12SecondarySemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
