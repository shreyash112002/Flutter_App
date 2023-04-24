import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/SigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/profilepage.dart';
import 'package:flutterapp/reusable_widgets.dart';
import 'package:flutterapp/NavBar.dart';
import 'package:http/http.dart' as http;
String stringResponse="";
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future apicall()async{
    http.Response response;
    response= await http.get(Uri.parse("https://script.googleusercontent.com/macros/echo?user_content_key=6RPNeodYn6AgdYB1JGy8QWVWGJMsReWOWRQ_Q6fBz8Kbw0gGDZzkaPdQ3FCmLA96tHrn2KnH8VlzE6wsdiCPhfMVW2a9sEA_m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnFSXqYz5yA0OeF_4ysSRPlsyFW0atSex235U53qS_0r78dMFQExKfDOzV75nCg5Hfwgnx5jFS10YTBXO0rSCUtFLKX14oexzZtz9Jw9Md8uu&lib=MxUoWSxTNx4Hk4n3l8SvlMA9o7N4CQEWp"));
    if(response.statusCode==200){
      setState(() {
        stringResponse=response.body;
      });
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
      title: Text('Home'),
      
      ),
      body: Center(
        child: Container(
          height: 200,
          width:300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
          child: Center(child: Text(stringResponse.toString()),),
        ),
      )
      
      
    );
  }
}
// Center(child: Text(stringResponse.toString())),