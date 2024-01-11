//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_test_project/Pages/HomeScreen.dart';
// import 'package:firebase_test_project/Pages/Login_page.dart';
// import 'package:firebase_test_project/Pages/Signup_page.dart';
// import 'package:flutter/material.dart';
//
// class CheckUser extends StatefulWidget {
//   const CheckUser({super.key});
//
//   @override
//   State<CheckUser> createState() => _CheckUserState();
// }
//
// class _CheckUserState extends State<CheckUser> {
//   @override
//   Widget build(BuildContext context) {
//     return checkuser();
//   }
//
//   checkuser(){
//     final user=FirebaseAuth.instance.currentUser;
//     if(user!=null){
//       return HomeScreen();
//     }
//     else{
//       return SignUp();
//     }
//   }
// }