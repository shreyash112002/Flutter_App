import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<DocumentSnapshot> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users1')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        _users = snapshot.docs;
        _isLoading = false;
      });
    });
  }

  void _deleteUser(String userId) {
    FirebaseFirestore.instance.collection('users1').doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user['username']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUser(user.id),
                  ),
                );
              },
            ),
    );
  }
}
