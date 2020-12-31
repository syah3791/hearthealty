import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hearthealthy/pages/intro/welcomePage.dart';
import 'package:hearthealthy/pages/sidebar/sidebar_layout.dart';

class SplashScreenPage extends StatefulWidget {
  bool isLogin;
  var user;
  SplashScreenPage({this.isLogin, this.user});
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return widget.isLogin ? SideBarLayout(user:widget.user) : WelcomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdfd7ca),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.3,
          heightFactor: 0.5,
          child: Image.asset(
            "assets/images/heart_beating_0.gif",
          ),
        ),
      ),
    );
  }
}