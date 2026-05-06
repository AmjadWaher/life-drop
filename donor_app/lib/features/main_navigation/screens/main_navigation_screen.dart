import 'package:donor_app/features/home/presentation/screens/home_screen.dart';
import 'package:donor_app/features/main_navigation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final indexNotifier = ValueNotifier(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => indexNotifier.value = index,
          ),
          body: ValueListenableBuilder(
            valueListenable: indexNotifier,
            builder: (context, currentIndex, child) {
              return screens[currentIndex];
            },
          ),
        );
      },
    );
  }
}
