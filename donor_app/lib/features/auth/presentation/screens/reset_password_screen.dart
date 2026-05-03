import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/password_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });
  final String email;
  final String code;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _newPasswordNotifier = ValueNotifier(true);
  final _confirmPasswordNotifier = ValueNotifier(true);

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordNotifier.dispose();
    _confirmPasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            TextInput.finishAutofillContext(shouldSave: true);

            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar(
                context,
                content: localizations.password_updated_message,
                backgroundColor: Colors.green.withAlpha(150),
              ),
            );
            context.pushNamedAndRemoveUntil(
              Routes.login,
              predicate: (route) => false,
            );
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
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        AuthTextSection(
                          title: localizations.reset_password,
                          titleStyle:
                              context.textStyles.font30TextPrimaryExtraBold,
                          subtitle: localizations.reset_subtitle,
                          subtitleStyle:
                              context.textStyles.font14TextPrimaryRegular,
                        ),
                        verticalSpace(32),
                        PasswordSection(
                          notifier: _newPasswordNotifier,
                          controller: _newPasswordController,
                          title: localizations.new_password,
                          hintText: '••••••••',
                          autofillHints: const [AutofillHints.newPassword],
                        ),

                        verticalSpace(10),
                        PasswordSection(
                          notifier: _confirmPasswordNotifier,
                          controller: _confirmPasswordController,
                          title: localizations.confirm_password,
                          hintText: '••••••••',
                          autofillHints: const [AutofillHints.newPassword],
                        ),
                        verticalSpace(24),
                        AppTextButton(
                          buttonText: localizations.update_password,
                          textStyle: context.textStyles.font16TextPrimaryBold,
                          isLoading: state.status == AuthStatus.loading,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_newPasswordController.text !=
                                _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar(
                                  context,
                                  content: localizations.passwords_do_not_match,
                                  icon: Icons.error_outline,
                                ),
                              );
                              return;
                            }
                            context.read<AuthCubit>().resetPassword(
                              widget.email,
                              widget.code,
                              _newPasswordController.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
