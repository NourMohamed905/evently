import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/onboarding_screens/on_boarding_screen.dart';
import 'package:evently/onboarding_screens/onboarding_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EventlyApp());
}

class EventlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        OnboardingOne.routeName: (_) => OnboardingOne(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: OnboardingOne.routeName,
    );
  }
}
