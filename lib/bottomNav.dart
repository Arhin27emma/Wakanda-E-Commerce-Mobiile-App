// ignore_for_file: file_names

import 'package:app/screens/fakestoreApi/_cartpage.dart';
import 'package:app/screens/fakestoreApi/paymentPage.dart';
import 'package:app/screens/fakestoreApi/store_screen.dart';
import 'package:app/screens/fakestoreApi/transHistory/transactionScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  static String routeName = "bottomNav.dart";

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;

  final pages = [
    const Product(),
    CartPage(),
    const PaymentCard(),
    const HistoryTransaction()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      const Icon(Icons.shopping_cart, size: 30, color: Colors.white),
      const Icon(
        Icons.payment_outlined,
        size: 30,
        color: Colors.white,
      ),
      const Icon(Icons.history, size: 30, color: Colors.white),
    ];
    return SafeArea(
      //top: false,
      child: Scaffold(
        //extendBody: false,
        body: pages[index],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.indigo,
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          onTap: (index)=> setState(() {
            this.index = index;
          }),
        ),
      ),
    );
  }
}
