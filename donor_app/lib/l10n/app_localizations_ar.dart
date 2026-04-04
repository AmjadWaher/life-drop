// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appFirstName => 'قطرة ';

  @override
  String get appLastName => 'حياة';

  @override
  String get appTagline => 'الحياة تنبض في دمك';

  @override
  String get splash_loading_text => 'جار الآن المزامنة...';

  @override
  String get app_version => 'الإصدار';

  @override
  String get app_build => 'صمم من أجل الإيثار';
}
