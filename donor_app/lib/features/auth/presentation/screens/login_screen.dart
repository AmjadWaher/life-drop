import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/login_form_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_switch_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  String? validateEmail(String email) {
    if (email.isEmpty) return 'Email is required.';
    if (!email.isValidEmail) return 'Invalid email.';
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required.';
    if (!password.isValidPassword) {
      return "Password must be more than 8 chars, include upper, lower, number, symbol, no spaces.";
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar(
                context,
                content: 'Success',
                backgroundColor: Colors.green.withAlpha(150),
              ),
            );
            // context.pushNamedAndRemoveUntil(
            //   Routes.home,
            //   predicate: (route) => false,
            // );
          } else if (state.status == AuthStatus.failure &&
              state.error != null) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar(
                context,
                icon: Icons.error_outline,
                content:
                    state.error?.getAllErrorMessages() ??
                    'Something went wrong',
                iconColor: context.colors.iconActive,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          AuthTextSection(
                            title: localizations.login,
                            subtitle: AppLocalizations.of(
                              context,
                            )!.welcome_back,
                          ),
                          verticalSpace(48),
                          LoginFormSection(
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          verticalSpace(40),
                          AppTextButton(
                            buttonText: localizations.login,
                            textStyle: context.textStyles.font16TextPrimaryBold,
                            isLoading: state.status == AuthStatus.loading,
                            onPressed: () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();

                              final emailError = validateEmail(email);
                              final passwordError = validatePassword(password);
                              if (emailError == null && passwordError == null) {
                                context.read<AuthCubit>().login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar(
                                    context,
                                    icon: Icons.error_outline,
                                    content:
                                        emailError ??
                                        passwordError ??
                                        'Something went wrong',
                                    iconColor: context.colors.iconActive,
                                  ),
                                );
                              }
                            },
                          ),
                          verticalSpace(15),
                          AuthSwitchSection(
                            text: localizations.new_donor,
                            actionText: AppLocalizations.of(
                              context,
                            )!.register_now,
                            onTap: () => context.pushNamed(Routes.register),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
