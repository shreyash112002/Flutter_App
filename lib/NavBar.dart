import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    String _useremail = 'Guest@gmail.com';
    // String _username = 'Guest';

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _useremail = user.displayName ?? user.email!;
    }
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/images/user.png")),
          decoration: const BoxDecoration(
            image: DecorationImage(
               image: AssetImage("assets/images/navimage.png"),
               fit: BoxFit.cover,
            ),
          ),
          // accountName: Text("."),
          accountEmail: Text(_useremail),
          accountName: null,
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Profile"),
          onTap: () {
            Navigator.of(context).pushNamed("/profile");
          },
        ),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text("Dashboard"),
          onTap: () {
            Navigator.of(context).pushNamed("/home");
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.info),
        //   title: Text("About us"),
        //   onTap: () {
        //     Navigator.of(context).pushNamed("/about");
        //   },
        // ),
      ]),
    );
  }
}
