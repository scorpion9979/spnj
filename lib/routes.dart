import 'package:flutter/material.dart';
import 'package:spnj/screens/welcome_screen.dart';

class Routes {
  static const String Welcome = '/welcome';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Welcome: (context) => WelcomeScreen(),
    };
  }
}
