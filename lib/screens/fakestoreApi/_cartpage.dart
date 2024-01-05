// ignore_for_file: file_names

import 'package:app/bottomNav.dart';
import 'package:app/screens/fakestoreApi/_cartList.dart';
import 'package:app/screens/fakestoreApi/paymentPage.dart';
import 'package:app/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class CartPage extends StatefulWidget {

  const CartPage({super.key});
  
  static String routeName = "/cartPage.dart";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pushNamed(context, BottomNavigation.routeName,),
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Badge(
              smallSize: 15,
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 28,
                color: Colors.indigo,
              ),
            ),
            
              
          ),
        ],
      ),
      body: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 252),
                    borderRadius: BorderRadius.circular(20)),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("carts")
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection("items").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot) {
                      if(snapshot.hasError){
                        return const Center(
                          child: Text("Sorry something went wrong")
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_,index){
                          DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                          String longtitle = documentSnapshot["title"];
                          int maxLengths = 15;
                          String title = longtitle.length > maxLengths ? "${longtitle.substring(0, maxLengths)}..." : longtitle;
                          return SwipeActionCell(
                            backgroundColor: Colors.transparent,
                            key: ObjectKey(FirebaseAuth.instance.currentUser!.email), 
                            trailingActions: [
                              SwipeAction(
                                //title: "Delete",
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                          
                                ),
                                forceAlignmentToBoundary: true,
                                performsFirstActionWithFullSwipe: true,
                                onTap: (CompletionHandler handler) async{
                                  print("deleted");

                                  await FirebaseFirestore.instance
                                  .collection("carts")
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("items")
                                  .doc(documentSnapshot.id)
                                  .delete();
                                }
                            )],
                            child: cartlist(
                              id: documentSnapshot["id"], 
                              title: title, 
                              price: documentSnapshot["price"], 
                              image: documentSnapshot["image"]
                          ),
                          );
                          
                        },
                      );
                    },
                  ),
                )

              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    
                    const SizedBox(height: 20,),
                    DefaultButton(text: "Check Out", press: () => Navigator.pushNamed(context, PaymentCard.routeName)),
                  ],
                ),
              ),
            ],
          )
      
    );
  }
}
