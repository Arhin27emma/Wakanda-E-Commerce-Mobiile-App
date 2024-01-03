import 'dart:io';

import 'package:app/screens/fakestoreApi/Profile/profileAuth.dart';
import 'package:flutter/material.dart';
import 'package:app/components/button.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static String routeName = '/profile.dart';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
//  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final AuthService _authService = AuthService(); // Initialize AuthService

  XFile? _selectedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 211, 202, 242),
                  child: GestureDetector(
                    onTap: () async {
                      _selectedImage = await _authService.pickProfileImage();
                      if (_selectedImage != null) {
                        setState(() {
                          _selectedImage = _selectedImage;
                        });
                      }
                    },
                    child: _selectedImage != null
                        ? Image.file(File(_selectedImage!.path), width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                        : const Icon(Icons.camera_alt_outlined, size: 20),
                  ),
                ),
                
                
                const SizedBox(height: 30),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Name",
                            hintText: "Enter Full Name",
                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.group)),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email address",
                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.email_outlined)),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Tel",
                            hintText: "Enter your phone number",
                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.phone)),
                      ),
                      const SizedBox(height: 30,),
                      //const SizedBox(height: 30,),
                      TextFormField(
                        controller: _addressController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Address",
                            hintText: "Enter your location address",
                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.map)),
                      ),
                      const SizedBox(height: 30,),
                      DefaultButton(
                        text: 'Update',
                        press: () async {

                        String profileImageUrl = '';

                        // If an image is selected, upload it and get the download URL
                        if (_selectedImage != null) {
                          profileImageUrl = await _authService.uploadProfile(_selectedImage!);
                        }
            
                        // Update user data in Firestore
                        await _authService.updateUserData(
                          _nameController.text,
                          _phoneController.text,
                          _addressController.text,
                          profileImageUrl,
                      );
                              
                        await _authService.updateEmail(_emailController.text);
                        _formKey.currentState!.reset();
                        }
                    ),
                    const SizedBox(height: 30,),
                    ])
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}