import 'package:donor_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme(),
          darkTheme: darkTheme(),
          debugShowCheckedModeBanner: false,
          home: const Scaffold(body: Center(child: Text('Hello World'))),
        );
      },
    );
  }
}
