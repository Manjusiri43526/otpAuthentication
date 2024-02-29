import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/homepage.dart';
import 'package:firebase_tutorial/loginpage.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget{
  const CheckUser({super.key});

  @override
  State<StatefulWidget> createState() {
    return CheckUserState();
  }
}
class CheckUserState extends State<CheckUser>{
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
  checkUser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      return const HomePage();
    } else{
      return const LoginPage();
    }
  }

}

