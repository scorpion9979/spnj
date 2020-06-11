import 'package:flutter/material.dart';
import 'package:spnj/routes.dart';
import 'package:spnj/widgets/screen.dart';
import 'package:spnj/widgets/logo_hero.dart';
import 'package:spnj/widgets/text_liquid_fill.dart';
import 'package:spnj/consts.dart';
import 'package:spnj/widgets/field_button.dart';

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
      duration: Duration(seconds: 1),
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
    return Screen(
      backgroundColor: animation.value,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoHero(size: 85.0),
            LogoText(animation: animation),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        FieldButton(
          text: 'Sign In',
          onPressed: () => Navigator.pushNamed(context, Routes.SignIn),
        ),
      ],
    );
  }
}

class LogoText extends StatelessWidget {
  const LogoText({this.animation});

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 240.0,
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
            boxBackgroundColor: animation.value,
            textStyle: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 75.0,
            ),
          ),
          Text(
            'SPNJ',
            style: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 75.0,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.0
                ..color = StyleGuide.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
