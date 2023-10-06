import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to the home page here
                Navigator.of(context).pop(); // This pops the current page and goes back to the previous page (assumes home is the previous page)
              },
            ),
          ],
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the user's email
    User? user = FirebaseAuth.instance.currentUser;
    String userEmail = user?.email ?? 'Guest';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/images/user.png'), // Replace with your image path
          ),
          SizedBox(height: 20.0),
          _buildProfileInfoItem('Email', userEmail),
        ],
      ),
    );
  }

  Widget _buildProfileInfoItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title + ': ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}