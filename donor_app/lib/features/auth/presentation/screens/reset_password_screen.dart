import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _newPasswordNotifier = ValueNotifier(true);
  final _confirmPasswordNotifier = ValueNotifier(true);
  String? _email;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map<String, dynamic>) {
        _email = args['email'] as String?;
      }
    });
  }

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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password updated successfully'),
                backgroundColor: Colors.green,
              ),
            );
            context.pushNamedAndRemoveUntil(
              Routes.login,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    AuthTextSection(
                      title: AppLocalizations.of(context)!.reset_password,
                      titleStyle: context.textStyles.font30TextPrimaryExtraBold,
                      subtitle: AppLocalizations.of(context)!.reset_subtitle,
                      subtitleStyle:
                          context.textStyles.font14TextPrimaryRegular,
                    ),
                    verticalSpace(32),
                    ValueListenableBuilder(
                      valueListenable: _newPasswordNotifier,
                      builder: (context, value, child) {
                        return AuthTextField(
                          obscureText: value,
                          controller: _newPasswordController,
                          title: AppLocalizations.of(context)!.new_password,
                          titleStyle: context.textStyles.font12SecondaryBold,
                          hintText: '••••••••',
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: context.colors.textPlaceHolder,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => _newPasswordNotifier.value =
                                !_newPasswordNotifier.value,
                            child: Icon(
                              value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: context.colors.textPlaceHolder,
                            ),
                          ),
                          hintTextStyle: context
                              .textStyles
                              .font16TextPlaceHolderMedium50Faded,
                        );
                      },
                    ),
                    verticalSpace(10),
                    ValueListenableBuilder(
                      valueListenable: _confirmPasswordNotifier,
                      builder: (context, value, child) {
                        return AuthTextField(
                          obscureText: value,
                          controller: _confirmPasswordController,
                          title: AppLocalizations.of(context)!.confirm_password,
                          titleStyle: context.textStyles.font12SecondaryBold,
                          hintText: '••••••••',
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: context.colors.textPlaceHolder,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => _confirmPasswordNotifier.value =
                                !_confirmPasswordNotifier.value,
                            child: Icon(
                              value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: context.colors.textPlaceHolder,
                            ),
                          ),
                          hintTextStyle: context
                              .textStyles
                              .font16TextPlaceHolderMedium50Faded,
                        );
                      },
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: AppLocalizations.of(context)!.update_password,
                      textStyle: context.textStyles.font16TextPrimaryBold,
                      isLoading: state.status == AuthStatus.loading,
                      onPressed: () {
                        if (_newPasswordController.text !=
                            _confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords do not match'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        // context.read<AuthCubit>().resetPassword(
                        //   _email ?? '',
                        //   _newPasswordController.text,
                        // );
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
}
