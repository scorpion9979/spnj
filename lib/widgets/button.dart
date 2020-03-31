import 'package:flutter/material.dart';
import 'package:spnj/consts.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  const Button({ this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: StyleGuide.buttonVertSpacing),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: StyleGuide.primaryColor,
            width: 2.0,
          ),
        ),
        color: Colors.white,
        textColor: StyleGuide.primaryColor,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
