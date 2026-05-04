import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/snack_bar.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/core/helpers/validations.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/auth/domain/params/register_params.dart';
import 'package:donor_app/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/register/register_state.dart';
import 'package:donor_app/features/auth/presentation/widgets/auth_switch_section.dart';
import 'package:donor_app/features/auth/presentation/widgets/register_section_one.dart';
import 'package:donor_app/features/auth/presentation/widgets/register_section_two.dart';
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
  AppLocalizations get localizations => AppLocalizations.of(context)!;
  final _pageIndex = ValueNotifier<int>(0);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _selectedBloodType = ValueNotifier<String?>(null);
  final _selectedBirthDate = ValueNotifier<String?>(null);
  final _selectedGovernorateId = ValueNotifier<String?>(null);
  final _selectedDistrictId = ValueNotifier<String?>(null);

  Widget _bodySections() {
    if (_pageIndex.value == 0) {
      return RegisterSectionOne(
        emailController: _emailController,
        phoneNumberController: _phoneNumberController,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
      );
    } else {
      return RegisterSectionTwo(
        selectedBirthDate: _selectedBirthDate,
        selectedBloodType: _selectedBloodType,
        selectedGovernorateId: _selectedGovernorateId,
        selectedDistrictId: _selectedDistrictId,
      );
    }
  }

  void _register() {
    FocusScope.of(context).unfocus();
    if (validRegisterSectionOne()) {
      if (_pageIndex.value == 0) {
        _pageIndex.value++;
      } else {
        if (validRegisterSectionTwo()) {
          context.read<RegisterCubit>().register(
            RegisterParams(
              firstName: _firstNameController.text.trim(),
              lastName: _lastNameController.text.trim(),
              email: _emailController.text.trim(),
              phoneNumber: _phoneNumberController.text.formatPhoneNumberJO(),
              dateOfBirth: _selectedBirthDate.value!,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text,
              governorateId: _selectedGovernorateId.value!,
              districtId: _selectedDistrictId.value!,
              bloodType: _selectedBloodType.value!,
            ),
          );
        }
      }
    }
  }

  bool validRegisterSectionOne() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneNumberController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    String? error;

    if (firstName.isEmpty) {
      error = localizations.first_name_required;
    } else if (lastName.isEmpty) {
      error = localizations.last_name_required;
    } else if (!email.isValidEmail) {
      error = Validations.validateEmail(context, email);
    } else if (!phone.isDigitsOnly) {
      error = localizations.phone_number_digits_only;
    } else if (phone.isEmpty || !phone.isValidJordanPhoneNumber) {
      error = localizations.phone_required;
    } else if (!password.isValidPassword) {
      error = Validations.validatePassword(context, password);
    } else if (password != confirmPassword) {
      error = localizations.passwords_do_not_match;
    }

    if (error != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(
          context,
          icon: Icons.error_outline,
          content: error,
          iconColor: context.colors.iconActive,
          maxLines: null,
        ),
      );
      return false;
    }
    return true;
  }

  bool validRegisterSectionTwo() {
    final bloodType = _selectedBloodType.value;
    final birthDate = _selectedBirthDate.value;
    final governorateId = _selectedGovernorateId.value;
    final districtId = _selectedDistrictId.value;

    String? error;

    if (birthDate == null) {
      error = localizations.birth_date_required;
    } else if (governorateId == null) {
      error = localizations.governorate_required;
    } else if (districtId == null) {
      error = localizations.district_required;
    } else if (bloodType == null) {
      error = localizations.blood_type_required;
    }

    if (error != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(
          context,
          icon: Icons.error_outline,
          content: error,
          iconColor: context.colors.iconActive,
          maxLines: null,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _pageIndex.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _selectedBirthDate.dispose();
    _selectedBloodType.dispose();
    _selectedDistrictId.dispose();
    _selectedGovernorateId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar(
              context,
              icon: Icons.info_outline,
              content: localizations.verification_code_sent,
              maxLines: null,
              backgroundColor: Colors.green.withAlpha(100),
            ),
          );

          context.pushReplacementNamed(
            Routes.otpVerification,
            arguments: {'email': _emailController.text, 'isFromRegister': true},
          );
        } else if (state.status == RegisterStatus.failure && state.error != null) {
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
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _bodySections(),
                      verticalSpace(20),
                      ValueListenableBuilder(
                        valueListenable: _pageIndex,
                        builder: (context, index, child) {
                          return AppTextButton(
                            buttonText: index == 0
                                ? AppLocalizations.of(context)!.next
                                : AppLocalizations.of(context)!.register,
                            textStyle: context.textStyles.font16TextPrimaryBold,
                            isLoading: state.status == RegisterStatus.loading,
                            onPressed: _register,
                          );
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
                      verticalSpace(30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
