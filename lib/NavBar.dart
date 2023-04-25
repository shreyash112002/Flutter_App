import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? user;
  String uid = '';
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user!.uid;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final userData = await userRef.get();
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final data = snapshot.data?.data();
          if (data != null) {
            final userName = data['UserName'] ?? '';
            final userEmail = user?.email ?? '';
            final userAvatarText = data['name']?[0] ?? '';
            return Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(userName),
                    accountEmail: Text(userEmail),
                    currentAccountPicture: CircleAvatar(
                      child: Text(userAvatarText),
                    ),
                  ),
                  // Other Drawer items
                ],
              ),
            );
          } else {
            return Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(''),
                    accountEmail: Text(''),
                    currentAccountPicture: CircleAvatar(),
                  ),
                  // Other Drawer items
                ],
              ),
            );
          }
        } else {
          return Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(''),
                  accountEmail: Text(''),
                  currentAccountPicture: CircleAvatar(),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About us"),
                  onTap: () {
                    Navigator.of(context).pushNamed("/about");
                  },
                )
              ],
            ),
          );
        }
      },
    );
  }
}
