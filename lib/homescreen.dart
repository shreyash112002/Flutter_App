import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/SigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/profilepage.dart';
import 'package:flutterapp/reusable_widgets.dart';
import 'package:flutterapp/NavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
      title: Text('Home'),
      ),
    );
  }
}
