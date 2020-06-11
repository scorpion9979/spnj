import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> children;
  final bool isHome;
  Screen({this.backgroundColor, this.children, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: isHome
          ? SafeArea(
              child: Stack(
                children: children,
              ),
            )
          : Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: children,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
