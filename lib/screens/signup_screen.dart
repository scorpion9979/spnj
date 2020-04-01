import 'package:flutter/material.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/input_field.dart';
import 'package:spnj/widgets/button.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
          InputField(
            controller: _emailController,
            hintText: 'Enter your email.',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          Button(
            text: 'Verify Email',
            onPressed: () {},
          )
        ],
    );
  }
}
