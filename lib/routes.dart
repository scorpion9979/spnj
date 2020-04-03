import 'package:flutter/material.dart';
import 'package:spnj/screens/welcome_screen.dart';
import 'package:spnj/screens/signin_screen.dart';
import 'package:spnj/screens/profile_setup_screen.dart';
import 'package:spnj/screens/home_screen.dart';

class Routes {
  static const String Welcome = 'welcome';
  static const String SignIn = 'signin';
  static const String ProfileSetup = 'profile_setup';
  static const String Home = 'home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Welcome: (context) => WelcomeScreen(),
      Routes.SignIn: (context) => SignInScreen(),
      Routes.ProfileSetup: (context) => ProfileSetupScreen(),
      Routes.Home: (context) => HomeScreen(),
    };
  }
}
