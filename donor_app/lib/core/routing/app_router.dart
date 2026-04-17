import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/login_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/register_screen.dart';
import 'package:donor_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:donor_app/features/donation_request/presentation/screens/request_accepted_screen.dart';
import 'package:donor_app/features/donation_request/presentation/screens/request_details_screen.dart';
import 'package:donor_app/features/home/presentation/screens/home_screen.dart';
import 'package:donor_app/features/main_navigation/screens/main_navigation_screen.dart';
import 'package:donor_app/features/onboarding/screens/onboarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case Routes.otpVerification:
        return MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            email: (args as Map<String, dynamic>)['email'] as String,
            isFromRegister: args['isFromRegister'] as bool,
          ),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );
      case Routes.mainNavigation:
        return MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        );
      case Routes.requestDetails:
        return MaterialPageRoute(
          builder: (context) => const RequestDetailsScreen(),
        );
      case Routes.requestAccepted:
        return MaterialPageRoute(
          builder: (context) => const RequestAcceptedScreen(),
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
