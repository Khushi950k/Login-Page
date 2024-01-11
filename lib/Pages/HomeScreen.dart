
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_project/Pages/Login_page.dart';
import 'package:firebase_test_project/Pages/Signup_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  String email;
  String password;
  String confirmpassword;
  HomeScreen({required this.email, required this.password, required this.confirmpassword});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.email}"),
          Text("${widget.password}"),
          Text("${widget.confirmpassword}"),

        ],
      )),
    );
  }
//   logout(){
// FirebaseAuth.instance.signOut();
//   }
}