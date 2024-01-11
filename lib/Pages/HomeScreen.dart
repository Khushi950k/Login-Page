
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_project/Pages/Login_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            });
          }, icon: Icon(Icons.logout))
        ],
      ),

    );
  }
}