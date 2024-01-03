import 'package:app/bottomNav.dart';
import 'package:app/global/common/toast.dart';
import 'package:app/screens/chatPage/chatPage.dart';
import 'package:app/screens/fakestoreApi/HelpCenter.dart';
import 'package:app/screens/fakestoreApi/_cartpage.dart';
import 'package:app/screens/fakestoreApi/fetchProfile/firebaseProfileAuth.dart';
import 'package:app/screens/fakestoreApi/fetchProfile/profileService.dart';
import 'package:app/screens/fakestoreApi/paymentPage.dart';
import 'package:app/screens/fakestoreApi/transHistory/transactionScreen.dart';
import 'package:app/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/screens/fakestoreApi/Profile/profile.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});
  static String routeName = "drawer.dart";

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  UserProfile? _userProfile; 
  final ProfileService _profileService = ProfileService();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      UserProfile? userProfile = await _profileService.fetchUserProfile();
      setState(() {
        _userProfile = userProfile;
      });
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Profile.routeName),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color.fromARGB(255, 211, 202, 242),
                child: _userProfile != null
                ? Image.network(_userProfile!.profileImage) // Use the profile image URL
                : Image.asset("assets/images/shirt.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userProfile?.name ?? 'User Name',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red,),
                      Text(
                      _userProfile?.location ?? 'Your Location',
                      style: const TextStyle(fontSize: 15, color: Colors.indigo),
                    ),]
                  ),
                ],
              )
            ],
          ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, BottomNavigation.routeName,),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          
                        },
                        icon: const Icon(Icons.home,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Home",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, CartPage.routeName,),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Carts",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, PaymentCard.routeName,),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.payment,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Payment",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, HistoryTransaction.routeName,),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.history,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Transactions",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChatPage.routeName,);
                } ,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Messages",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HelpCenter.routeName,);
                } ,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.help,
                            size: 20, color: Colors.indigo)),
                    const Text(
                      "Help Center",
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  GoogleSignIn().disconnect();
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, SignInScreen.routeName,);
                  showToast(message: "You have signed out of Wakanda");
                },
                child: Row(
                  children: [
                    IconButton(
                      tooltip: 'Loggin out ',
                      onPressed: () {},
                      icon: const Icon(Icons.logout,
                      size: 20, color: Colors.red)
                    ),
                    
                    const Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ],
    ));
  }
}
