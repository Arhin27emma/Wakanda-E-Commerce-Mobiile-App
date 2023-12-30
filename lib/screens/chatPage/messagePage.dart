import 'package:flutter/material.dart';


class Messages extends StatelessWidget {
  const Messages({super.key});
  static String routeName = "/messagePage.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Isaac Tommel", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
        actions: const[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("3:00pm", style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
        ],
        
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}