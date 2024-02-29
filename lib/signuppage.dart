import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/homepage.dart';
import 'package:firebase_tutorial/ui_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomeAlertBox(context, "Enter Required fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const HomePage(),
                )));
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomeAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomeTextField(
              emailController, "Enter your Email", Icons.email, false),
          UiHelper.CustomeTextField(passwordController, "Enter Your Password",
              Icons.remove_red_eye, true),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomeButton(() {
            SignUp(emailController.text.toString(),
                passwordController.text.toString());
          }, "Sign Up")
        ],
      ),
    );
  }
}
