import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/homescreen.dart';
import 'package:flutterapp/profilepage.dart';
import 'package:flutterapp/splashScreen.dart';
import 'splashScreen.dart';
import 'SigninScreen.dart';
import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/signup': (context) => SigninScreen(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

