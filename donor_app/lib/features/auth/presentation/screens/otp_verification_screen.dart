import 'dart:async';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
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
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _pinController = PinInputController();
  final _timerNotifier = ValueNotifier(60);
  late Timer _timer;
  String? _email;
  bool _isFromRegister = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map<String, dynamic>) {
        _email = args['email'] as String?;
        _isFromRegister = args['isFromRegister'] as bool? ?? true;
      }
    });
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
          if (state.status == AuthStatus.success) {
            if (_isFromRegister) {
              context.pushNamedAndRemoveUntil(
                Routes.home,
                predicate: (route) => false,
              );
            } else {
              context.pushNamed(
                Routes.resetPassword,
                arguments: {'email': _email},
              );
            }
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
                      title: AppLocalizations.of(context)!.otp_verification,
                      titleStyle: context.textStyles.font30TextPrimaryExtraBold,
                      subtitle: AppLocalizations.of(context)!.otp_subtitle,
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
                      buttonText: AppLocalizations.of(context)!.verify_continue,
                      textStyle: context.textStyles.font16TextPrimaryBold,
                      isLoading: state.status == AuthStatus.loading,
                      onPressed: () {
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
                          text: AppLocalizations.of(context)!.resend_code,
                          actionText: value > 0
                              ? '${AppLocalizations.of(context)!.resend_timer}: $min:$sec'
                              : AppLocalizations.of(context)!.resend_code,
                          onTap: () {},
                        );
                      },
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

  void _verifyOtp(BuildContext context, String otp) {
    if (_isFromRegister) {
      // context.read<AuthCubit>().verifyOtpForRegister(_email ?? '', otp);
    } else {
      // context.read<AuthCubit>().verifyOtpForForgotPassword(_email ?? '', otp);
    }
  }
}
