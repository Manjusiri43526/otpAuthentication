import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/forgotpassword.dart';
import 'package:firebase_tutorial/homepage.dart';
import 'package:firebase_tutorial/signuppage.dart';
import 'package:firebase_tutorial/ui_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomeAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
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
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomeTextField(
            emailController,
            "Enter your email",
            Icons.email,
            false,
          ),
          UiHelper.CustomeTextField(passwordController, "Enter your password",
              Icons.remove_red_eye, true),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomeButton(() {
            Login(emailController.text.toString(),
                passwordController.text.toString());
          }, "Login"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already Have an Account??",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ));
              },
              child: const Text(
                "Forgot password??",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
