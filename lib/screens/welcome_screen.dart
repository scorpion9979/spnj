import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spnj/consts.dart';
import 'package:spnj/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
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
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      color: StyleGuide.primaryColor,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    height: 65.0,
                  ),
                ),
                SizedBox(
                  width: 175.0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      TextLiquidFill(
                        text: 'SPNJ',
                        waveDuration: Duration(
                          milliseconds: 1500,
                        ),
                        loadDuration: Duration(
                          milliseconds: 4000,
                        ),
                        waveColor: StyleGuide.primaryColor,
                        boxBackgroundColor: Theme.of(context).canvasColor,
                        textStyle: TextStyle(
                          fontFamily: 'LeckerliOne',
                          fontSize: 65.0,
                        ),
                        boxHeight: 110.0,
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
