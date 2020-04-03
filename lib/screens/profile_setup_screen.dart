import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/routes.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/field_input.dart';
import 'package:spnj/widgets/field_button.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _displayNameController = TextEditingController();
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

  void _setupProfile() async {
    try {
      final profile = UserUpdateInfo()
        ..displayName = _displayNameController.text;
      await user.updateProfile(profile);
      Navigator.pushReplacementNamed(context, Routes.ProfileSetup);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        LogoHero(size: 200.0),
        SizedBox(
          height: 30.0,
        ),
        FieldInput(
          controller: _displayNameController,
          hintText: 'Pick a display name',
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        FieldButton(
          text: 'Finish Setup',
          onPressed: () => _setupProfile(),
        )
      ],
    );
  }
}
