import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/ui_helper.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

   forgotPassword(String email) async {
    if (email=="") {
      return UiHelper.CustomeAlertBox(context, "Please fill the required fields");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomeTextField(
            emailController,
            "Enter your Email",
            Icons.email_outlined,
            false,
          ),
          const SizedBox(
            height: 20,
          ),
          UiHelper.CustomeButton(() {
            forgotPassword(emailController.text.toString());
          }, "Reset Password")
        ],
      ),
    );
  }
}
