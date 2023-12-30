import 'package:app/bottomNav.dart';
import 'package:app/screens/chatPage/chatPage.dart';
import 'package:app/screens/chatPage/messagePage.dart';
import 'package:app/screens/fakestoreApi/HelpCenter.dart';
import 'package:app/screens/fakestoreApi/_cartpage.dart';
import 'package:app/screens/fakestoreApi/categoryList.dart/categorylist.dart';
import 'package:app/screens/fakestoreApi/paymentPage.dart';
import 'package:app/screens/fakestoreApi/paymentWindow.dart';
import 'package:app/screens/fakestoreApi/products.dart';
import 'package:app/screens/fakestoreApi/store_screen.dart';
import 'package:app/screens/fakestoreApi/transHistory/transactionScreen.dart';
import 'package:app/screens/forget_password/forget_password_screen.dart';
import 'package:app/screens/sign_in/signUpscreen.dart';
import 'package:app/screens/sign_in/sign_in_screen.dart';
import 'package:app/screens/splashScreen.dart';
import 'package:app/screens/fakestoreApi/Profile/profile.dart';
import 'package:flutter/material.dart';

late final ProductModel cart;

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => const SplashScreen(),
  SignInScreen.routeName:(context) => const SignInScreen(),
  ForgetPassword.routeName:(context) => const ForgetPassword(),
  Product.routeName:(context) => const Product(),
  CartPage.routeName:(context) => const CartPage(),
  PaymentCard.routeName:(context) => const PaymentCard(),
  BottomNavigation.routeName:(context) => const BottomNavigation(),
  SignUpScreen.routeName:(context) => const SignUpScreen(),
  PayWindow.routeName:(context) => const PayWindow(),
  HistoryTransaction.routeName:(context) => const HistoryTransaction(),
  CategoryList.routeName:(context) => const CategoryList(),
  Profile.routeName:(context) => const Profile(),
  HelpCenter.routeName:(context) => const HelpCenter(),
  ChatPage.routeName:(context) => const ChatPage(),
  Messages.routeName:(context) => const Messages()
};