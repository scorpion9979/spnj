import 'package:flutter/material.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/field_input.dart';
import 'package:spnj/widgets/field_button.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        LogoHero(size: 200.0),
        SizedBox(
          height: 25.0,
        ),
        FieldInput(
          controller: _emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 15,
        ),
        FieldInput(
          controller: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        FieldButton(
          text: 'Log in',
          onPressed: () {},
        )
      ],
    );
  }
}
