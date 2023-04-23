import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/reusable_widgets.dart';

import 'utils/mytheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/signup');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("0096FF"),
          hexStringToColor("89CFF0"),
          hexStringToColor("F0FFFF")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: logoWidget("assets/images/pl.png"),
            ),
          ],
        ),
      ),
    );
  }
}
