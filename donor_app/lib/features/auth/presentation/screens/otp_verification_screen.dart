import 'dart:async';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_switch_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({
    super.key,
    required this.email,
    this.isFromRegister = true,
  });
  final String email;
  final bool isFromRegister;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  final _pinController = PinInputController();
  final _timerNotifier = ValueNotifier(60);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerNotifier.value == 0) {
        timer.cancel();
      } else {
        _timerNotifier.value--;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    _timerNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success &&
              (state.action == AuthAction.verifyOtp ||
                  state.action == AuthAction.verifyRegistration)) {
            if (widget.isFromRegister) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar(
                  context,
                  content: localizations.account_acreated_message,
                  backgroundColor: Colors.green.withAlpha(150),
                ),
              );
              context.pushNamedAndRemoveUntil(
                Routes.login,
                predicate: (route) => false,
              );
            } else {
              context.pushNamed(
                Routes.resetPassword,
                arguments: {'email': widget.email, 'code': _pinController.text},
              );
            }
          } else if (state.status == AuthStatus.failure &&
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
                        title: localizations.otp_verification,
                        titleStyle:
                            context.textStyles.font30TextPrimaryExtraBold,
                        subtitle: widget.isFromRegister
                            ? AppLocalizations.of(
                                context,
                              )!.otp_from_register_subtitle
                            : AppLocalizations.of(
                                context,
                              )!.otp_from_forgot_password_subtitle,
                        subtitleStyle:
                            context.textStyles.font14TextPrimaryRegular,
                      ),
                      verticalSpace(32),
                      MaterialPinField(
                        length: 6,
                        pinController: _pinController,
                        onCompleted: (pin) => _verifyOtp(context, pin),
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.outlined,
                          filledFillColor: context.colors.surface,
                          focusedFillColor: context.colors.secondary.withAlpha(
                            100,
                          ),
                          focusedBorderColor: context.colors.secondary,
                          cursorColor: context.colors.textPrimary,
                          cellSize: const Size(45, 64),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      verticalSpace(24),
                      AppTextButton(
                        buttonText: localizations.verify_continue,
                        textStyle: context.textStyles.font16TextPrimaryBold,
                        isLoading: state.status == AuthStatus.loading,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_pinController.text.length == 6) {
                            _verifyOtp(context, _pinController.text);
                          }
                        },
                      ),
                      verticalSpace(30),
                      ValueListenableBuilder(
                        valueListenable: _timerNotifier,
                        builder: (context, value, child) {
                          final min = (value ~/ 60).toString().padLeft(2, '0');
                          final sec = (value % 60).toString().padLeft(2, '0');
                          return AuthSwitchSection(
                            text: AppLocalizations.of(
                              context,
                            )!.didnt_receive_code,
                            actionText: value > 0
                                ? '${localizations.resend_timer}: $min:$sec'
                                : localizations.resend_again,
                            onTap: () {
                              if (value == 0) {
                                _timerNotifier.value = 60;
                                _startTimer();
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar(
                                    context,
                                    content: localizations.resend_code_message,
                                    backgroundColor: Colors.green.withAlpha(
                                      150,
                                    ),
                                  ),
                                );
                                _resendOtp(context);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _verifyOtp(BuildContext context, String otp) {
    if (widget.isFromRegister) {
      context.read<AuthCubit>().verifyRegistration(widget.email, otp);
    } else {
      context.read<AuthCubit>().verifyOtp(widget.email, otp);
    }
  }

  void _resendOtp(BuildContext context) {
    if (widget.isFromRegister) {
      context.read<AuthCubit>().resendRegistrationOtp(widget.email);
    } else {
      context.read<AuthCubit>().resendOtp(widget.email);
    }
  }
}
