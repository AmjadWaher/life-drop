import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
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
            context.pushNamedAndRemoveUntil(
              Routes.home,
              predicate: (route) => false,
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
                              if (_emailController.text.trim().isNotEmpty &&
                                  _passwordController.text.trim().isNotEmpty) {}
                              // context.read<AuthCubit>().login(
                              //   _emailController.text.trim(),
                              //   _passwordController.text,
                              // );
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
