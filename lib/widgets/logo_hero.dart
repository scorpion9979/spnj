import 'package:flutter/material.dart';

class LogoHero extends StatelessWidget {
  final double size;
  const LogoHero({this.size});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        child: Image.asset('images/logo.png'),
        height: size,
      ),
    );
  }
}
