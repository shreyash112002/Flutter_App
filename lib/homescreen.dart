import 'package:flutter/material.dart';
import 'NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Home Page"),
        
      ),
    );
  }
}