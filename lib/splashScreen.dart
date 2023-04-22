import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

import 'homescreen.dart';  
  
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage(),));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/images/Parking_logo.jpg")]),)
    );
  }
}