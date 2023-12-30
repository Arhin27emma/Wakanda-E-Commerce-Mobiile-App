// ignore_for_file: file_names, use_build_context_synchronously

import 'package:app/bottomNav.dart';
import 'package:app/components/button.dart';
import 'package:app/global/common/toast.dart';
import 'package:app/screens/sign_in/auth.dart';
import 'package:app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = "signUpscreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, BottomNavigation.routeName);
    }
    catch (e){
      return e;
    }
  }
/*
    Future<UserCredential> signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      Navigator.of(context).pushNamedAndRemoveUntil("homepage", (route) => false);
    }

*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            "Sign Up",
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Sign up with your email and password \nor login with your social account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SignForm(),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCards(
                      icon: MdiIcons.google,
                      color: Colors.red,
                      press: () {
                        signInWithGoogle();
                      },
                    ),
                    SocialCards(
                      icon: Icons.facebook,
                      color: Colors.blue,
                      press: () {
                        //signInWithFacebook();
                      },
                    ),
                    SocialCards(
                      icon: Icons.apple,
                      color: Colors.black,
                      press: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const NoAccount()
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class NoAccount extends StatelessWidget {
  const NoAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.indigo, fontSize: 15),
            ))
      ]),
    );
  }
}

class SocialCards extends StatelessWidget {
  const SocialCards({
    Key? key,
    required this.icon,
    required this.press,
    required this.color,
  }) : super(key: key);

  final VoidCallback press;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        height: 46,
        width: 46,
        decoration: const BoxDecoration(
            color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _ConfirmpasswordController = TextEditingController();
  //final _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
    super.dispose();
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _ConfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void signUp() async {
    //String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "Successfully Registered");
      Navigator.pushNamed(context, BottomNavigation.routeName);
    }else{
      showToast(message: "Registration is unsuccessfull");
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            buildEmmailFormfield(),
            const SizedBox(
              height: 20,
            ),
            buildPasswordFormField(),
            const SizedBox(
              height: 20,
            ),
            buildConfirmPasswordField(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              text: "Sign Up",
              press: signUp,
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names

  TextFormField buildEmmailFormfield() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      controller: _ConfirmpasswordController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Repeat your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }
}
