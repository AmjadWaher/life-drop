// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get life_drop => 'Life Drop';

  @override
  String get app_first_name => 'Life';

  @override
  String get app_last_name => ' Drop';

  @override
  String get app_tagline => 'LIFE IS IN YOUR BLOOD';

  @override
  String get splash_loading_text => 'INITIALIZING SYNC...';

  @override
  String get app_version => 'Version';

  @override
  String get app_build => 'Built for Altruism';

  @override
  String get pulse => 'Pulse';

  @override
  String get onboarding_title_1 => 'Save life with\nevery drop';

  @override
  String get onboarding_title_2 => 'Approved Donations';

  @override
  String get onboarding_title_3_part_1 => 'Smart';

  @override
  String get onboarding_title_3_part_2 => '\nNotifications';

  @override
  String get onboarding_subtitle_1 => 'Join a global network of altruistic heroes dedicated `to providing life-saving blood donations.';

  @override
  String get onboarding_subtitle_2 => 'Every donation is clinically verified and tracked from your arm to the patient in need.';

  @override
  String get onboarding_subtitle_3 => 'Receive instant alerts when your specific blood type is needed urgently in nearby hospitals.';

  @override
  String get next => 'Next';

  @override
  String get get_started => 'Get Started';

  @override
  String get login => 'Login';

  @override
  String get welcome_back => 'WELCOME BACK, READY TO SAVE LIFE?';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get register_now => 'Register Now';

  @override
  String get forgot_password => 'Forgot Password?';

  @override
  String get new_donor => 'New Donor?';

  @override
  String get register => 'Register';

  @override
  String get become_donor => 'BECOME A LIFE-SAVING DONOR';

  @override
  String get first_name => 'First Name';

  @override
  String get last_name => 'Last Name';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get new_password => 'New Password';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get select_blood_type => 'SELECT BLOOD TYPE';

  @override
  String get already_have_an_account => 'Already have an account?';

  @override
  String get forgot_password_subtitle => 'Enter your registered email or phone number toreceive a verification code.';

  @override
  String get back_to_login => 'Back to Login';

  @override
  String get send_otp => 'Send OTP';

  @override
  String get otp_verification => 'OTP Verification';

  @override
  String get otp_subtitle => 'We\'ve sent a 6-digit code to your registered device. Enter it below to continue.';

  @override
  String get verify_continue => 'Verify & Continue';

  @override
  String get reset_password => 'Reset Password';

  @override
  String get reset_subtitle => 'Ensure your new password is at least 8 characters long with clinical precision.';

  @override
  String get update_password => 'Update Password';

  @override
  String get didnt_receive_code => 'Didn\'t receive code?';

  @override
  String get resend_timer => 'Resend in';

  @override
  String get resend_again => 'Resend again';

  @override
  String get required => 'REQUIRED';

  @override
  String get quick_login => 'Quick Login';

  @override
  String get enable_biometric_login_message => 'Use your fingerprint for faster and secure login next time';

  @override
  String get accounts => 'Accounts';

  @override
  String get authenticate_to_login => 'Authenticate to Login';

  @override
  String get use_fingerprint_for_quick_secure_login => 'Use your fingerprint to login quickly and securely';

  @override
  String get enable => 'Enable';

  @override
  String get skip => 'Skip';

  @override
  String get welcome_back_home => 'Welcome Back,';

  @override
  String donationImpactMessage(Object hospital) {
    return 'Your last donation helped save 3 lives at $hospital.';
  }

  @override
  String nextDonationAvailability(Object days) {
    return ' You\'re eligible to donate again in $days days.';
  }

  @override
  String get total_contributions => 'Total Contributions';

  @override
  String get donations => 'Donations';

  @override
  String get tens_donation => 'Donations';

  @override
  String get active_requests => 'Active Requests';

  @override
  String get urgent_priority => 'URGENT PRIORITY';
}
