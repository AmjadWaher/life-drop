import 'dart:developer';

import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

abstract class Validations {
  static String? validateEmail(BuildContext context, String email) {
    if (!email.isValidEmail || email.isEmpty) {
      return AppLocalizations.of(context)!.email_required;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String password) {
    if (!password.isValidPassword || password.isEmpty) {
      return AppLocalizations.of(context)!.password_required;
    }
    return null;
  }
}
