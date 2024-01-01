// ignore_for_file: file_names, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class cartlist extends StatefulWidget {
  const cartlist({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  final int id;
  final String title;
  final double price;
  final String image;

  @override
  State<cartlist> createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {

  int value = 1;

  @override
  void initState() {
    super.initState();
    updateCounterPrice();
  }

  void valueIncrement(){
    setState(() {
      value++;
      updateCounterPrice();
    });
  }
  void valueDecreement(){
    setState(() {
      if (value > 1) {
        value--;
        updateCounterPrice();
      }
    });
  }
 
  final CollectionReference _counterCollection =
  FirebaseFirestore.instance.collection('carts');

  Future updateCounterPrice() async{
    try{
      await _counterCollection.doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(widget.id.toString()).update({
      'id':widget.id,
      'counterValue':value,
    });
    } catch(e){
      print('Error adding data: $e');
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,c
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    widget.image,
                    width: 120,
                    height: 120,
                    
                  ),
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "\$${widget.price}",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5),
                                ]),
                            child: IconButton(
                              onPressed: () {
                                valueIncrement();
                              },
                              icon: const Icon(CupertinoIcons.add, size: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "$value",
                                style: const TextStyle(fontSize: 17),
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5),
                                ]),
                            child: IconButton(
                              onPressed: () {
                                valueDecreement();
                              },
                              icon: const Icon(CupertinoIcons.minus, size: 20),
                            ),
                          ),
                    
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
