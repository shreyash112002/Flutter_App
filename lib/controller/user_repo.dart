import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp/controller/user_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class UserRepository extends StatefulWidget {
  const UserRepository({super.key});

  @override
  State<UserRepository> createState() => _UserRepositoryState();
}

class _UserRepositoryState extends State<UserRepository> {
  static UserRepository get instance => Widget as UserRepository;
  final _db = FirebaseFirestore.instance;

  void createUser(UserModel user) async {
    await _db
        .collection("User")
        .add(user.toJson())
        .then((value) =>
            Get.snackbar("Succesfull", "Your Account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.1),
            colorText: Colors.white))
        .catchError((error) => 
            Get.snackbar("Error","Failed to create your account.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.1),
            colorText: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
