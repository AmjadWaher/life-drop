import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
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
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.pushNamed(
              Routes.otpVerification,
              arguments: {
                'email': _emailController.text.trim(),
                'isFromRegister': false,
              },
            );
          } else if (state.status == AuthStatus.failure &&
              state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!.getAllErrorMessages()),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    AuthTextSection(
                      title: AppLocalizations.of(context)!.forgot_password,
                      titleStyle: context.textStyles.font30TextPrimaryExtraBold,
                      subtitle: AppLocalizations.of(
                        context,
                      )!.forgot_password_subtitle,
                      subtitleStyle:
                          context.textStyles.font14TextPrimaryRegular,
                    ),
                    verticalSpace(32),
                    AuthTextField(
                      controller: _emailController,
                      title: AppLocalizations.of(context)!.email,
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
                      buttonText: AppLocalizations.of(context)!.send_otp,
                      textStyle: context.textStyles.font16TextPrimaryBold,
                      isLoading: state.status == AuthStatus.loading,
                      onPressed: () {
                        // context.read<AuthCubit>().sendOtpForForgotPassword(
                        //   _emailController.text.trim(),
                        // );
                        context.pushNamed(Routes.otpVerification);
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
                            AppLocalizations.of(context)!.back_to_login,
                            style: context.textStyles.font14TextPrimaryBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
