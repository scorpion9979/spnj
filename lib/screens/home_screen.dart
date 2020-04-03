import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/widgets/screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      if (currentUser != null) {
        user = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: <Widget>[],
    );
  }
}
