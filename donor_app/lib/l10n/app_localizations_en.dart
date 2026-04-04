// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appFirstName => 'Life';

  @override
  String get appLastName => ' Drop';

  @override
  String get appTagline => 'LIFE IS IN YOUR BLOOD';

  @override
  String get splash_loading_text => 'INITIALIZING SYNC...';

  @override
  String get app_version => 'Version';

  @override
  String get app_build => 'Built for Altruism';
}
