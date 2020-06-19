import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spnj/routes.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/field_button.dart';
import 'package:spnj/consts.dart';
import 'package:international_phone_input/international_phone_input.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final _auth = FirebaseAuth.instance;

class _SignInScreenState extends State<SignInScreen> {
  String phoneNum;

  void _verifySMS(context) {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
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

  void _onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNum = internationalizedPhoneNumber;
    });
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
          height: StyleGuide.separator(context),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 25.0, 0.0),
          child: InternationalPhoneInput(
            decoration: InputDecoration(
              hintText: '555-555-4321',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              focusColor: StyleGuide.primaryColor,
              hoverColor: StyleGuide.primaryColor,
              fillColor: StyleGuide.primaryColor,
              border: OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: StyleGuide.primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
            onPhoneNumberChange: _onPhoneNumberChange,
            enabledCountries: ['+964', '+39'],
            showCountryCodes: false,
          ),
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
