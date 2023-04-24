import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp/homescreen.dart';
import 'package:flutterapp/profilepage.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBYLS7fcfBMgdfcShszR-5IcBXMg_wp2aqw&usqp=CAU")),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://4kwallpapers.com/images/wallpapers/valley-landscape-aesthetic-mountains-gradient-background-3840x2160-4589.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        accountName: Text("Nilesh Ghavate"),
        accountEmail: Text("nilesh@dbit.in"),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Profile"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text("Dashboard"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
      ListTile(
        leading: Icon(Icons.info),
        title: Text("About us"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    ]));
  }
}
