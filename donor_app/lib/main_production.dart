import 'dart:async';
import 'dart:ui';

import 'package:donor_app/app.dart';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await ScreenUtil.ensureScreenSize();
      await Firebase.initializeApp();
      initDependencies();
      FlutterError.onError = (details) {
        FirebaseCrashlytics.instance.recordFlutterError(details);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
        return true;
      };
      runApp(App(appRouter: AppRouter()));
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}
