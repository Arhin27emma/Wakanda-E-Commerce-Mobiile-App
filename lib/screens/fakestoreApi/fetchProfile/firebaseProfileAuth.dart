import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String name;
  final String profileImage;
  final String location;
  final String email;

  UserProfile({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.email,
  });

  // Factory method to create UserProfile from a Firestore document
  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserProfile(
      name: data['name'] ?? '',
      profileImage: data['image'] ?? '',
      location: data['address'] ?? '',
      email: data['email'] ?? '',
    );
  }
}
