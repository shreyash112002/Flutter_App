import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   User? user;
//   String uid = '';
//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       uid = user!.uid;
//     }
//   }

//   Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
//     final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
//     final userData = await userRef.get();
//     return userData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getUserData(),
//       builder: (context,
//           AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasData) {
//           final data = snapshot.data?.data();
//           if (data != null) {
//             final userName = data['UserName'] ?? '';
//             final userEmail = user?.email ?? '';
//             final userAvatarText = data['name']?[0] ?? '';
//             return Drawer(
//               child: Column(
//                 children: [
//                   UserAccountsDrawerHeader(
//                     accountName: Text(userName),
//                     accountEmail: Text(userEmail),
//                     currentAccountPicture: CircleAvatar(
//                       child: Text(userAvatarText),
//                     ),
//                   ),
//                   // Other Drawer items
//                 ],
//               ),
//             );
//           } else {
//             return Drawer(
//               child: Column(
//                 children: [
//                   UserAccountsDrawerHeader(
//                     accountName: Text(''),
//                     accountEmail: Text(''),
//                     currentAccountPicture: CircleAvatar(),
//                   ),
//                   // Other Drawer items
//                 ],
//               ),
//             );
//           }
//         } else {
//           return Drawer(
//             child: Column(
//               children: [
//                 UserAccountsDrawerHeader(
//                   accountName: Text(''),
//                   accountEmail: Text(''),
//                   currentAccountPicture: CircleAvatar(),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.info),
//                   title: Text("About us"),
//                   onTap: () {
//                     Navigator.of(context).pushNamed("/about");
//                   },
//                 )
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class NavBar extends StatelessWidget {
//   NavBar({Key? key}) : super(key: key);
//   String _username = 'Guest';

//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//   _username = user.displayName ?? user.email!;
// }

//   @override
//   Widget build(BuildContext context) {
//     print("Firebase User ${user}");
//     return Drawer(
//       child: ListView(children: [
//         UserAccountsDrawerHeader(
//           currentAccountPicture: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBYLS7fcfBMgdfcShszR-5IcBXMg_wp2aqw&usqp=CAU")),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                   "https://4kwallpapers.com/images/wallpapers/valley-landscape-aesthetic-mountains-gradient-background-3840x2160-4589.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           accountName: Text("username"),
//           accountEmail: Text(user!.email),
//         ),
//         ListTile(
//           leading: Icon(Icons.account_circle),
//           title: Text("Profile"),
//           onTap: () {
//             Navigator.of(context).pushNamed("/profile");
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.dashboard),
//           title: Text("Dashboard"),
//           onTap: () {
//             Navigator.of(context).pushNamed("/dashboard");
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.info),
//           title: Text("About us"),
//           onTap: () {
//             Navigator.of(context).pushNamed("/about");
//           },
//         ),
//       ]),
//     );
//   }
// }

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
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBYLS7fcfBMgdfcShszR-5IcBXMg_wp2aqw&usqp=CAU")),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://4kwallpapers.com/images/wallpapers/valley-landscape-aesthetic-mountains-gradient-background-3840x2160-4589.jpg"),
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
