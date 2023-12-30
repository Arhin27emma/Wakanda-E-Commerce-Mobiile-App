import 'package:app/bottomNav.dart';
import 'package:app/components/button.dart';
import 'package:app/global/common/toast.dart';
import 'package:app/screens/forget_password/forget_password_screen.dart';
import 'package:app/screens/sign_in/auth.dart';
import 'package:app/screens/sign_in/signUpscreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String routeName = "/sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, BottomNavigation.routeName);
      }
    } catch (e) {
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

      }

      */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            "Sign In",
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
                  "Sign in with your email or password \nor login with your social account",
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
          "Don't have an account? ",
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: const Text(
              "Signup",
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
  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() async {

    //String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "Signed in successfully");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, BottomNavigation.routeName);
    }
    else{
      showToast(message: "Sign in is unsuccessful");
    }
  }


  late bool remember = false;

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
            RememForgetOption(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(text: "Sign In", press: signIn)
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Row RememForgetOption() {
    return Row(
      children: [
        Checkbox(
            value: remember,
            onChanged: (value) {
              setState(() {
                remember = value!;
              });
            }),
        const Text("Remember me"),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, ForgetPassword.routeName),
          child: const Text(
            "Forget password?",
            style: TextStyle(
                color: Color.fromARGB(255, 33, 93, 243),
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

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
}
