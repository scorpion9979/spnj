import 'package:flutter/material.dart';
import 'package:spnj/consts.dart';

class FieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final keyboardType;

  FieldInput({
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        style: TextStyle(
          fontSize: 18,
        ),
        controller: controller,
        enableSuggestions: true,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: StyleGuide.primaryColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          focusColor: StyleGuide.primaryColor,
          hoverColor: StyleGuide.primaryColor,
          fillColor: StyleGuide.primaryColor,
          border: OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: StyleGuide.primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
