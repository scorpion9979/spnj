import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/routes.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/field_input.dart';
import 'package:spnj/widgets/field_button.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _phoneNumController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _verifySMS(context) {
    _auth.verifyPhoneNumber(
      phoneNumber: _phoneNumController.text,
      timeout: Duration(seconds: 10),
      verificationCompleted: (credential) async {
        final authResult = await _auth.signInWithCredential(credential);
        if (authResult.user.displayName == null) {
          Navigator.pushReplacementNamed(context, Routes.ProfileSetup);
        } else {
          Navigator.pushReplacementNamed(context, Routes.Home);
        }
      },
      verificationFailed: (e) => print('Failed: ${e.message}'),
      codeSent: null,
      codeAutoRetrievalTimeout: null,
    );
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
          controller: _phoneNumController,
          hintText: 'Phone number',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: 10,
        ),
        FieldButton(
          text: 'Verify',
          onPressed: () => _verifySMS(context),
        ),
      ],
    );
  }
}
