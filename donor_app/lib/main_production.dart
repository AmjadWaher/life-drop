import 'package:donor_app/app.dart';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  initDependencies();
  runApp(App(appRouter: AppRouter()));
}
