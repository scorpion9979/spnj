import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> children;
  final Widget bottomNavigationBar;
  final bool isHome;
  Screen(
      {this.backgroundColor,
      this.children,
      this.bottomNavigationBar,
      this.isHome = false});

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      return Scaffold(
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: children,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      );
    }
    return Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: Center(
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
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
