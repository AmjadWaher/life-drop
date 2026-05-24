import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/logic/biometric/biometric_cubit.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/auth/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/otp/otp_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:donor_app/features/auth/presentation/logic/reset_password/reset_password_cubit.dart';
import 'package:donor_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/login_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/register_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:donor_app/features/donation_request/presentation/screens/request_accepted_screen.dart';
import 'package:donor_app/features/donation_request/presentation/screens/request_details_screen.dart';
import 'package:donor_app/features/home/presentation/logic/home_cubit.dart';
import 'package:donor_app/features/main_navigation/screens/main_navigation_screen.dart';
import 'package:donor_app/features/onboarding/screens/onboarding_view.dart';
import 'package:donor_app/features/profile/domain/entities/user_entity.dart';
import 'package:donor_app/features/profile/presentation/logic/cooldown/cooldown_cubit.dart';
import 'package:donor_app/features/profile/presentation/logic/edit_profile/edit_profile_cubit.dart';
import 'package:donor_app/features/profile/presentation/logic/profile/profile_cubit.dart';
import 'package:donor_app/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:donor_app/features/profile/presentation/screens/language_settings_screen.dart';
import 'package:donor_app/features/profile/presentation/screens/theme_settings_screen.dart';
import 'package:donor_app/features/requests/presentation/logic/active_donation/active_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/cancel_donation/cancel_donation_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/cancellation_reasons/cancellation_reasons_cubit.dart';
import 'package:donor_app/features/requests/presentation/screens/cancel_donation_screen.dart';
import 'package:donor_app/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.otpVerification:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OtpCubit>(),
            child: OTPVerificationScreen(
              email: (args as Map<String, dynamic>)['email'] as String,
              isFromRegister: args['isFromRegister'] as bool,
            ),
          ),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPasswordScreen(
              email: (args as Map<String, dynamic>)['email'],
              code: args['code'],
            ),
          ),
        );
      case Routes.mainNavigation:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..loadHome()
                  ..checkBiometricPrompt(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<ActiveDonationCubit>()..getCurrentActiveDonation(),
              ),
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getUserProfile(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<CooldownCubit>()..getCooldownStatus(),
              ),
            ],
            child: const MainNavigationScreen(),
          ),
        );
      case Routes.requestDetails:
        return MaterialPageRoute(
          builder: (context) => RequestDetailsScreen(
            requestId: (args as Map<String, dynamic>)['requestId'],
          ),
        );
      case Routes.requestAccepted:
        return MaterialPageRoute(
          builder: (context) => const RequestAcceptedScreen(),
        );
      case Routes.cancelRequests:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<CancelDonationCubit>()),
              BlocProvider(
                create: (context) =>
                    getIt<CancellationReasonsCubit>()..getCancellationReasons(),
              ),
            ],
            child: CancelDonationScreen(
              requestId: (args as Map<String, String>)['requestId']!,
            ),
          ),
        );

      case Routes.accountSettings:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BiometricCubit>()..init(),
              ),
              BlocProvider.value(
                value:
                    (args as Map<String, dynamic>)['profileCubit']
                        as ProfileCubit,
              ),
            ],
            child: AccountSettingsScreen(user: args['user']),
          ),
        );
      case Routes.languageSettings:
        return MaterialPageRoute(
          builder: (context) => const LanguageSettingsScreen(),
        );
      case Routes.themeSettings:
        return MaterialPageRoute(
          builder: (context) => const ThemeSettingsScreen(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>()..getGovernorates(),
            child: EditProfileScreen(user: args as UserEntity),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}
