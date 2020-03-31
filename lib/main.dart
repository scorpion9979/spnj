import 'package:flutter/material.dart';
import 'package:spnj/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.Welcome,
      routes: Routes.getRoutes(),
    );
  }
}
