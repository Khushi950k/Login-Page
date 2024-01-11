import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test_project/Pages/HomeScreen.dart';
import 'package:firebase_test_project/Widgets/UiHelper.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  SignUp(String email,String password, String confirmpassword)async{
    if(email=="" && password=="" && confirmpassword==""){
      return log("Enter Required Field's");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              HomeScreen(email: email, password: password, confirmpassword: confirmpassword)));

        }).then((value){
          FirebaseFirestore.instance.collection("Users").doc(email).set({
            "Email":email
          });
        }).then((value){
          log("Data Instered");
        });
      }
      on FirebaseAuthException catch(ex){
        log(ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailcontroller, "Enter Email", Icons.email, false),
          UiHelper.CustomTextField(passwordcontroller, "Enter password", Icons.password, true),
          UiHelper.CustomTextField(confirmpasswordcontroller, "Enter Confirm password", Icons.password, true),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            SignUp(emailcontroller.text.toString(), passwordcontroller.text.toString(),
                confirmpasswordcontroller.text.toString());
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }, child: Text("Sign Up", style:TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}