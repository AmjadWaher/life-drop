import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AppLocalizations get localizations => AppLocalizations.of(context)!;
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.success) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar(
              context,
              content: localizations.send_code_message,
              backgroundColor: Colors.green.withAlpha(150),
            ),
          );
          context.pushNamed(
            Routes.otpVerification,
            arguments: {
              'email': _emailController.text.trim(),
              'isFromRegister': false,
            },
          );
        } else if (state.status == ForgotPasswordStatus.failure &&
            state.error != null) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar(
              context,
              content: state.error!.getAllErrorMessages(),
              icon: Icons.error_outline,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    AuthTextSection(
                      title: localizations.forgot_password,
                      titleStyle: context.textStyles.font30TextPrimaryExtraBold,
                      subtitle: localizations.forgot_password_subtitle,
                      subtitleStyle:
                          context.textStyles.font14TextPrimaryRegular,
                    ),
                    verticalSpace(32),
                    AuthTextField(
                      controller: _emailController,
                      title: localizations.email,
                      titleStyle: context.textStyles.font12SecondaryBold,
                      hintText: 'donor@pulse.com',
                      prefixIcon: AppImages(
                        path: ImagePaths.atSign,
                        type: ImageType.svg,
                        color: context.colors.textPlaceHolder,
                      ),
                      hintTextStyle:
                          context.textStyles.font16TextPlaceHolderMedium50Faded,
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: localizations.send_otp,
                      textStyle: context.textStyles.font16TextPrimaryBold,
                      isLoading: state.status == ForgotPasswordStatus.loading,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context.read<ForgotPasswordCubit>().sendOtp(
                          _emailController.text.trim(),
                        );
                      },
                    ),
                    verticalSpace(30),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: context.colors.textPrimary,
                            size: 15.w,
                          ),
                          horizontalSpace(2),
                          Text(
                            localizations.back_to_login,
                            style: context.textStyles.font14TextPrimaryBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
