
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});
    static String routeName = "HelpCenter.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. For the credit card testing use the card number, 4084084084084081",
              style: TextStyle(
                fontSize: 18,  color: Colors.indigo),
              ),
              SizedBox(height: 20),
              Text(
                "2. Use 408 for the cvv",
              style: TextStyle(
                fontSize: 18,  color: Colors.indigo),
              ),
              SizedBox(height: 20),
              Text(
                "3. Use your actual email address",
              style: TextStyle(
                fontSize: 18,  color: Colors.indigo),
              ),
              SizedBox(height: 20),
              Text(
                "4. You can enter payment amount for testing eg. 10000, paystack convert it to 100.00",
              style: TextStyle(
                fontSize: 18,  color: Colors.indigo),
              ),

            ],
          ),
        )
      ),
    );
  }
}