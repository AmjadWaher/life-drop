import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    // This arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    switch (setting.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}
