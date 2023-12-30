import 'package:app/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: "Email already exit");
      }
      else{
        showToast(message: "All fields required");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } on FirebaseAuthException catch (e){
      
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: "Invalid email or password");
      }
      else{
        showToast(message: "error: ${e.code}");
      }
    }
    return null;
  }
}