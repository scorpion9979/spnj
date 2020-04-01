import 'package:flutter/material.dart';
import 'package:spnj/screens/welcome_screen.dart';
import 'package:spnj/screens/login_screen.dart';
import 'package:spnj/screens/signup_screen.dart';

class Routes {
  static const String Welcome = '/welcome';
  static const String LogIn = '/login';
  static const String SignUp = '/signup';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Welcome: (context) => WelcomeScreen(),
      Routes.LogIn: (context) => LogInScreen(),
      Routes.SignUp: (context) => SignUpScreen(),
    };
  }
}
