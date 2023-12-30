import 'package:app/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> updateUserData(String userId, String name, String phone, String address) async {
    try {
      await _firestore.collection('profile').doc(userId).set({
        'name': name,
        'phone': phone,
        'address': address,
      });
      showToast(message: 'Successfully updated your profile');
    } catch (e) {
      showToast(message: 'Update is unsuccessful');
      print('Error updating user data: $e');
    }
  }

  Future<void> updateEmail(String newEmail) async {
    try {
      await _auth.currentUser!.updateEmail(newEmail);
    } catch (e) {
      showToast(message: 'Email update is unsuccessful');
      print('Error updating email: $e');
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      await _auth.currentUser!.updatePassword(newPassword);
    } catch (e) {
      showToast(message: 'Password update is unsuccessful');
      print('Error updating password: $e');
    }
  }

  Future<void> updateUsername(String username, String userId) async {
    try {
      await _firestore.collection("profile").doc(userId).update({'name': username});
    } catch (e) {
      showToast(message: 'Username update is unsuccessful');
      print('Error updating username: $e');
    }
  }
}
