// ignore_for_file: camel_case_types

import 'package:app/global/common/toast.dart';
import 'package:app/screens/sign_in/signUpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static String routeName = "./forget_password_screen.dart";

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final _emailController = TextEditingController();

  Future resetPassword() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());

      showToast(message: "Password reset");
    } on FirebaseAuthException catch (e) {
      showToast(message: "Password reset: $e");
    }
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Forgot Password")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please enter your email address to get a link \n to recover a new password for your account",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                      child: Column(
                        children: [FieldForm()],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                    press: resetPassword,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet? ",
                        style: TextStyle(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                        child: const Text(
                          "Signup",
                          style: TextStyle(color: Colors.indigo, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField FieldForm() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: "Enter your email",
          labelText: "Email",
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
    required this.press,
  });
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
          onPressed: press,
          child: const Text(
            "Continue",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
