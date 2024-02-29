import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logOut()async{
   FirebaseAuth.instance.signOut().then((value){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}