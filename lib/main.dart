import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/auth/register_screen.dart';
import 'package:evently/event/create_event.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/onboarding_screens/on_boarding_screen.dart';
import 'package:evently/onboarding_screens/onboarding_one.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  runApp(EventlyApp(seenOnboarding: seenOnboarding));
}

// ignore: must_be_immutable
class EventlyApp extends StatelessWidget {
  bool seenOnboarding;
  EventlyApp({super.key, required this.seenOnboarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        OnboardingOne.routeName: (_) => OnboardingOne(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        CreateEvent.routeName: (_) => CreateEvent(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: seenOnboarding
          ? HomeScreen.routeName
          : OnboardingOne.routeName,
    );
  }
}
