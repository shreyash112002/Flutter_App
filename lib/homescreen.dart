import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/SigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/profilepage.dart';
import 'package:flutterapp/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Home')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ('Profile'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              _currentIndex = index;

              break;
            case 1:
              // navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
          ;
        },
      ),
    );
  }
}
