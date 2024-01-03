import 'package:app/screens/fakestoreApi/fetchProfile/firebaseProfileAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserProfile?> fetchUserProfile() async {
    var email = _auth.currentUser!.email;
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('ProfileInfo')
          .doc(email)
          .get();

      if (userDoc.exists) {
        return UserProfile.fromFirestore(userDoc);
      } else {
        // User document doesn't exist
        return null;
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      return null;
    }
  }
}
