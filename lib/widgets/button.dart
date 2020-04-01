import 'package:flutter/material.dart';
import 'package:spnj/consts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  const Button({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StyleGuide.buttonHorSpacing,
            vertical: StyleGuide.buttonVertSpacing,
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: StyleGuide.primaryColor,
                width: 1.0,
              ),
            ),
            color: Color(0x4FFFFFFF),
            textColor: StyleGuide.primaryColor,
            onPressed: onPressed,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
