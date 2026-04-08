import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
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
            context.pushNamed(Routes.otpVerification, arguments: state.email);
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
                            // context.read<AuthCubit>().register(
                            //   RegisterParams(
                            //     firstName: _firstNameController.text.trim(),
                            //     lastName: _lastNameController.text.trim(),
                            //     email: _emailController.text.trim(),
                            //     phone: _phoneNumberController.text.trim(),
                            //     password: _passwordController.text,
                            //     confirmPassword:
                            //         _confirmPasswordController.text,
                            //     bloodType: _selectedBloodType!,
                            //   ),
                            // );
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
