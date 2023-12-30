import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(0, 60, 31, 172);
const lightColor = Color(0xFFFFECDF);
const lineargradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 113, 51, 138), Color.fromARGB(0, 60, 31, 172)],
);

const textColor = Color.fromARGB(255, 228, 222, 249);

const animationDuration = Duration(microseconds: 200);

final RegExp emailValidatirRegExp = 
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email address";
const String invalidEmailError = "Please enter a valid email address";
const String passNullError = "Please enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords does not match";

const dummyUrl = "https://dummyjson.com/products";