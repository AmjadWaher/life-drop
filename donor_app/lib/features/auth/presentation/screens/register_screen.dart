import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/domain/params/register_params.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/auth_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_switch_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_text_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/register_form_section.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _selectedBloodType = ValueNotifier<String?>(null);

  bool validRegister() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneNumberController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    String? error;

    if (firstName.isEmpty) {
      error = "First name is required";
    } else if (lastName.isEmpty) {
      error = "Last name is required";
    } else if (email.isEmpty) {
      error = "Email is required";
    } else if (!email.isValidEmail) {
      error = "Invalid email";
    } else if (phone.isEmpty) {
      error = "Phone is required";
    } else if (password.isEmpty) {
      error = "Password is required";
    } else if (!password.isValidPassword) {
      error = "Weak password";
    } else if (confirmPassword.isEmpty) {
      error = "Confirm password is required";
    } else if (password != confirmPassword) {
      error = "Passwords do not match";
    } else if (_selectedBloodType.value == null) {
      error = "Select blood type";
    }

    if (error != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(
          context,
          icon: Icons.error_outline,
          content: error,
          iconColor: context.colors.iconActive,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
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
                icon: Icons.info_outline,
                content: 'Account created successfully',
                backgroundColor: Colors.green.withAlpha(100),
              ),
            );

            context.pushNamed(
              Routes.otpVerification,
              arguments: {
                'email': _emailController.text,
                'isFromRegister': true,
              },
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
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              behavior: HitTestBehavior.opaque,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      top: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        AuthTextSection(
                          title: AppLocalizations.of(context)!.register,
                          subtitle: AppLocalizations.of(context)!.become_donor,
                        ),
                        verticalSpace(35),
                        RegisterFormSection(
                          emailController: _emailController,
                          passwordController: _passwordController,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          confirmPasswordController: _confirmPasswordController,
                          phoneNumberController: _phoneNumberController,
                          onBloodTypeSelected: (bloodType) {
                            _selectedBloodType.value = bloodType;
                          },
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          buttonText: AppLocalizations.of(context)!.register,
                          textStyle: context.textStyles.font16TextPrimaryBold,
                          isLoading: state.status == AuthStatus.loading,
                          onPressed: () {
                            if (validRegister()) {
                              context.read<AuthCubit>().register(
                                RegisterParams(
                                  firstName: _firstNameController.text.trim(),
                                  lastName: _lastNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  phone: _phoneNumberController.text.trim(),
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                  bloodType: _selectedBloodType.value!,
                                ),
                              );
                            }
                          },
                        ),
                        verticalSpace(15),
                        AuthSwitchSection(
                          text: AppLocalizations.of(
                            context,
                          )!.already_have_an_account,
                          actionText: AppLocalizations.of(context)!.login,
                          onTap: () => context.pop(),
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
