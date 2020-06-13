import 'package:flutter/material.dart';
import 'package:spnj/consts.dart';

class FieldTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool autoFocus;
  final keyboardType;

  FieldTextArea({
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        autofocus: this.autoFocus,
        maxLines: 4,
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
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          focusColor: StyleGuide.primaryColor,
          hoverColor: StyleGuide.primaryColor,
          border: OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: StyleGuide.primaryColor, width: 0.75),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: StyleGuide.primaryColor, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
