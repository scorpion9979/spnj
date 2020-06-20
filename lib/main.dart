import 'package:flutter/material.dart';
import 'package:spnj/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/screens/home_screen.dart';
import 'package:spnj/screens/welcome_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: await getLandingPage(),
      routes: Routes.getRoutes(),
    ),
  );
}

Future<Widget> getLandingPage() async {
  return StreamBuilder<FirebaseUser>(
    stream: _auth.onAuthStateChanged,
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
        return HomeScreen();
      }
      return WelcomeScreen();
    },
  );
}
