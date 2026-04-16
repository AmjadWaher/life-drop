import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @life_drop.
  ///
  /// In en, this message translates to:
  /// **'Life Drop'**
  String get life_drop;

  /// No description provided for @app_first_name.
  ///
  /// In en, this message translates to:
  /// **'Life'**
  String get app_first_name;

  /// No description provided for @app_last_name.
  ///
  /// In en, this message translates to:
  /// **' Drop'**
  String get app_last_name;

  /// No description provided for @app_tagline.
  ///
  /// In en, this message translates to:
  /// **'LIFE IS IN YOUR BLOOD'**
  String get app_tagline;

  /// No description provided for @splash_loading_text.
  ///
  /// In en, this message translates to:
  /// **'INITIALIZING SYNC...'**
  String get splash_loading_text;

  /// No description provided for @app_version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get app_version;

  /// No description provided for @app_build.
  ///
  /// In en, this message translates to:
  /// **'Built for Altruism'**
  String get app_build;

  /// No description provided for @pulse.
  ///
  /// In en, this message translates to:
  /// **'Pulse'**
  String get pulse;

  /// No description provided for @onboarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Save life with\nevery drop'**
  String get onboarding_title_1;

  /// No description provided for @onboarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Approved Donations'**
  String get onboarding_title_2;

  /// No description provided for @onboarding_title_3_part_1.
  ///
  /// In en, this message translates to:
  /// **'Smart'**
  String get onboarding_title_3_part_1;

  /// No description provided for @onboarding_title_3_part_2.
  ///
  /// In en, this message translates to:
  /// **'\nNotifications'**
  String get onboarding_title_3_part_2;

  /// No description provided for @onboarding_subtitle_1.
  ///
  /// In en, this message translates to:
  /// **'Join a global network of altruistic heroes dedicated `to providing life-saving blood donations.'**
  String get onboarding_subtitle_1;

  /// No description provided for @onboarding_subtitle_2.
  ///
  /// In en, this message translates to:
  /// **'Every donation is clinically verified and tracked from your arm to the patient in need.'**
  String get onboarding_subtitle_2;

  /// No description provided for @onboarding_subtitle_3.
  ///
  /// In en, this message translates to:
  /// **'Receive instant alerts when your specific blood type is needed urgently in nearby hospitals.'**
  String get onboarding_subtitle_3;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'WELCOME BACK, READY TO SAVE LIFE?'**
  String get welcome_back;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @new_donor.
  ///
  /// In en, this message translates to:
  /// **'New Donor?'**
  String get new_donor;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @become_donor.
  ///
  /// In en, this message translates to:
  /// **'BECOME A LIFE-SAVING DONOR'**
  String get become_donor;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @select_blood_type.
  ///
  /// In en, this message translates to:
  /// **'SELECT BLOOD TYPE'**
  String get select_blood_type;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @forgot_password_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email or phone number toreceive a verification code.'**
  String get forgot_password_subtitle;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get back_to_login;

  /// No description provided for @send_otp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get send_otp;

  /// No description provided for @otp_verification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otp_verification;

  /// No description provided for @otp_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit code to your registered device. Enter it below to continue.'**
  String get otp_subtitle;

  /// No description provided for @verify_continue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verify_continue;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @reset_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Ensure your new password is at least 8 characters long with clinical precision.'**
  String get reset_subtitle;

  /// No description provided for @update_password.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get update_password;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get didnt_receive_code;

  /// No description provided for @resend_timer.
  ///
  /// In en, this message translates to:
  /// **'Resend in'**
  String get resend_timer;

  /// No description provided for @resend_again.
  ///
  /// In en, this message translates to:
  /// **'Resend again'**
  String get resend_again;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'REQUIRED'**
  String get required;

  /// No description provided for @quick_login.
  ///
  /// In en, this message translates to:
  /// **'Quick Login'**
  String get quick_login;

  /// No description provided for @enable_biometric_login_message.
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint for faster and secure login next time'**
  String get enable_biometric_login_message;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accounts;

  /// No description provided for @authenticate_to_login.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to Login'**
  String get authenticate_to_login;

  /// No description provided for @use_fingerprint_for_quick_secure_login.
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint to login quickly and securely'**
  String get use_fingerprint_for_quick_secure_login;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @welcome_back_home.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back,'**
  String get welcome_back_home;

  /// No description provided for @donationImpactMessage.
  ///
  /// In en, this message translates to:
  /// **'Your last donation helped save 3 lives at {hospital}.'**
  String donationImpactMessage(Object hospital);

  /// No description provided for @nextDonationAvailability.
  ///
  /// In en, this message translates to:
  /// **' You\'re eligible to donate again in {days} days.'**
  String nextDonationAvailability(Object days);

  /// No description provided for @total_contributions.
  ///
  /// In en, this message translates to:
  /// **'Total Contributions'**
  String get total_contributions;

  /// No description provided for @donations.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get donations;

  /// No description provided for @tens_donation.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get tens_donation;

  /// No description provided for @active_requests.
  ///
  /// In en, this message translates to:
  /// **'Active Requests'**
  String get active_requests;

  /// No description provided for @urgent_priority.
  ///
  /// In en, this message translates to:
  /// **'URGENT PRIORITY'**
  String get urgent_priority;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
