import 'package:flutter/material.dart';
import 'package:spnj/widgets/text_liquid_fill_mod.dart';
import 'package:spnj/consts.dart';
import 'package:spnj/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.lightBlueAccent,
      end: Colors.white,
    ).animate(controller);
    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller
      ..stop()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 60.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 75.0,
                  ),
                ),
                SizedBox(
                  width: 190.0,
                  height: 240.0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      TextLiquidFillMod(
                        text: 'SPNJ',
                        waveDuration: Duration(
                          milliseconds: 1500,
                        ),
                        loadDuration: Duration(
                          milliseconds: 4000,
                        ),
                        waveColor: StyleGuide.primaryColor,
                        boxBackgroundColor: animation.value,
                        textStyle: TextStyle(
                          fontFamily: 'LeckerliOne',
                          fontSize: 65.0,
                        ),
                      ),
                      Text(
                        'SPNJ',
                        style: TextStyle(
                          fontFamily: 'LeckerliOne',
                          fontSize: 65.0,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.0
                            ..color = StyleGuide.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                StyleGuide.buttonHorSpacing,
                0.0,
                StyleGuide.buttonHorSpacing,
                0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Button(
                    text: 'Log In',
                    onPressed: () {},
                  ),
                  Button(
                    text: 'Sign Up',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
