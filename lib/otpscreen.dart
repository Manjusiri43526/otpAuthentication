import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/homepage.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
  OtpScreen({super.key, required this.verificationid});

  @override
  State<StatefulWidget> createState() {
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OtpScreen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter the OTP",
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                try{
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(verificationId: widget.verificationid,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  });
                } catch(e){
                  log(e.toString());
                }
              },
              child: const Text("OTP"))
        ],
      ),
    );
  }
}
