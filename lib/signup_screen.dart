import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp/SigninScreen.dart';
import 'package:flutterapp/controller/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core'; // add this import statement
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'homescreen.dart';
import 'reusable_widgets.dart';
import 'utils/mytheme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _userNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("0096FF"),
            hexStringToColor("89CFF0"),
            hexStringToColor("F0FFFF")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),

                firebaseUIButton(context, "Sign Up", () {
                  try {
                    
                  } catch (e) {
                    
                  }
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");

                    // create a new document in Firestore with the user's information
                    FirebaseFirestore.instance
                        .collection(
                            'users1') // create a new collection named 'users'
                        .doc(value.user!
                            .uid) // create a new document with the user's UID
                        .set({
                          'username': _userNameTextController.text,
                          'email': _emailTextController.text,
                          'password': _passwordTextController.text
                        })
                        .then((value) => Get.snackbar(
                            "Succesfull", "Your Account has been created.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.1),
                            colorText: Colors.white))
                        .catchError((error) => Get.snackbar(
                            "Error", "Failed to create your account.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.1),
                            colorText: Colors.white));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SigninScreen()));
                  }).onError((error, stackTrace) => null);
                })
              ],
            ),
          ))),
    );
  }
}
