import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:donor_app/features/auth/presentation/widgets/blood_type_selector.dart';
import 'package:donor_app/features/auth/presentation/widgets/horizontal_field.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({
    super.key,
    required this.emailController,
    required this.phoneNumberController,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.onBloodTypeSelected,
  });
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<String>? onBloodTypeSelected;

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  final passwordNotifier = ValueNotifier(true);
  final confirmPasswordNotifier = ValueNotifier(true);
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  @override
  void dispose() {
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        HorizontalField(
          firstController: widget.firstNameController,
          secondController: widget.lastNameController,
          firstTitle: localizations.first_name,
          secondTitle: localizations.last_name,
          firstHintText: localizations.first_name,
          secondHintText: localizations.last_name,
          firstPrefixIcon: const Icon(Icons.person_outline),
          secondPrefixIcon: const Icon(Icons.person_outline),
        ),
        verticalSpace(15),
        HorizontalField(
          firstController: widget.emailController,
          secondController: widget.phoneNumberController,
          firstTitle: localizations.email,
          secondTitle: localizations.phone_number,
          firstHintText: 'donor@pulse.com',
          secondHintText: '+962 7XXXXXXXX',
          firstPrefixIcon: AppImages(
            path: ImagePaths.atSign,
            type: ImageType.svg,
            color: context.colors.textPlaceHolder,
          ),
          secondPrefixIcon: Icon(
            Icons.phone_outlined,
            color: context.colors.textPlaceHolder,
          ),
        ),
        verticalSpace(15),
        _passwordSection(),
        verticalSpace(20),
        BloodTypeSelector(onBloodTypeSelected: widget.onBloodTypeSelected),
      ],
    );
  }

  Widget _passwordSection() {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: passwordNotifier,
          builder: (context, value, child) {
            return Expanded(
              child: AuthTextField(
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
              ),
            );
          },
        ),
        horizontalSpace(10),
        ValueListenableBuilder(
          valueListenable: confirmPasswordNotifier,
          builder: (context, value, child) {
            return Expanded(
              child: AuthTextField(
                obscureText: value,
                controller: widget.confirmPasswordController,
                title: localizations.confirm_password,
                titleStyle: context.textStyles.font12SecondaryBold,
                hintText: '••••••••',
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: context.colors.textPlaceHolder,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => confirmPasswordNotifier.value =
                      !confirmPasswordNotifier.value,
                  child: Icon(
                    value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: context.colors.textPlaceHolder,
                  ),
                ),
                hintTextStyle:
                    context.textStyles.font16TextPlaceHolderMedium50Faded,
              ),
            );
          },
        ),
      ],
    );
  }
}
