import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_project/Pages/HomeScreen.dart';
import 'package:firebase_test_project/Pages/Signup_page.dart';
import 'package:firebase_test_project/Widgets/UiHelper.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    loginpage(String email,String password)async{
      if(email=="" && password==""){
       return log("Enter Required Field's");
      }
      else{
        UserCredential? userCredential;
        try{
          userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
            log("User Instered");
          });
        }
        on FirebaseAuthException catch(ex){
          log(ex.code.toString());
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailcontroller, "Enter Email", Icons.email, false),
          UiHelper.CustomTextField(passwordcontroller, "Enter password", Icons.password, true),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            loginpage(emailcontroller.text.toString(), passwordcontroller.text.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          }, child: Text("Login", style:TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),),
        ],
      ),
    );
  }
}
