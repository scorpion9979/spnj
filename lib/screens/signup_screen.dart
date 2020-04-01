import 'package:flutter/material.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/field_input.dart';
import 'package:spnj/widgets/field_button.dart';

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
          FieldInput(
            controller: _emailController,
            hintText: 'Enter your email.',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          FieldButton(
            text: 'Verify Email',
            onPressed: () {},
          )
        ],
    );
  }
}
