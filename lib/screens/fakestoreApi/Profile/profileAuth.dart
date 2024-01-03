
import 'dart:io';

import 'package:app/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<XFile?> pickProfileImage() async {
    ImagePicker imagePicker = ImagePicker();
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<String> uploadProfile(XFile image) async {
    String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();

    Reference reference = FirebaseStorage.instance.ref();
    Reference referenceDirImages = reference.child('images');

    Reference uploadProfileToReference = referenceDirImages.child(uniqueFilename);

    try {
      // Upload the image file
      await uploadProfileToReference.putFile(File(image.path));

      // Get the download URL of the uploaded image
      String downloadURL = await uploadProfileToReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("$e");
      return '$e';
    }
  }  


  Future<void> updateUserData(String userId, String name, String phone, String address, String imageUrl) async {
    try {
      await _firestore.collection('ProfileInfo').doc(_auth.currentUser!.email).collection("profile").doc(userId).set({
        'name': name,
        'phone': phone,
        'address': address,
        'image':imageUrl,
        
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
