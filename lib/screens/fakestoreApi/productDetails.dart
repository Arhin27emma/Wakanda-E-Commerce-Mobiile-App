// ignore_for_file: file_names, camel_case_types

import 'package:app/bottomNav.dart';
import 'package:app/screens/fakestoreApi/_cartController.dart';
import 'package:app/screens/fakestoreApi/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class productDetails extends StatefulWidget {
  const productDetails({super.key, required this.product});
  static String routeName = "./productDetails.dart";

  final ProductModel product;

  @override
  State<productDetails> createState() => _productDetailsState();
}


class _productDetailsState extends State<productDetails> {
            
  Map<String, dynamic>? productData;
  int value = 1;
  double totalprice = 0.0;


  

  @override
  void initState() {
    super.initState();
    totalprice = widget.product.price;
    updateCounterPrice();
  }

  void valueIncrement(){
    setState(() {
      value++;
      totalprice = value * widget.product.price;
      updateCounterPrice();
    });
  }
  void valueDecreement(){
    setState(() {
      if (value > 1) {
        value--;
        totalprice = value * widget.product.price;
        updateCounterPrice();
      }
    });
  }
 
  final CollectionReference _counterCollection =
  FirebaseFirestore.instance.collection('carts');

  Future updateCounterPrice() async{
    try{
      await _counterCollection.doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(widget.product.id.toString()).update({
      'id':widget.product.id,
      'counterValue':value,
      'price':totalprice,
    });
    } catch(e){
      print('Error adding data: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {

  //final cart = Provider.of<Cartitems>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.product.image),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 1000,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 252),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star, color: Colors.red),
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        Icon(Icons.star, color: Colors.red),
                                        Icon(Icons.star, color: Colors.red),
                                        Icon(Icons.star_border_outlined,
                                            color: Colors.red),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rating: \t ${widget.product.rating}",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.indigo),
                              ),
                            ],
                          ),
                          Text(
                            "GHC ${widget.product.price}",
                            style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.product.description,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.indigo),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 3),
                                      ]),
                                  child: IconButton(onPressed: (){
                                    valueDecreement();
                                  }, icon: const Icon(CupertinoIcons.minus, size: 20),),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "$value",
                                      style: const TextStyle(fontSize: 17),
                                    )),
                                Container(
                                  width: 30,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5),
                                      ]),
                                  child: IconButton(onPressed: (){
                                    valueIncrement();
                                  }, icon: const Icon(CupertinoIcons.add, size: 20),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BottomNavigation.routeName);
                  }, icon: const Icon(Icons.arrow_back_ios)),
              Text(
                "GHC $totalprice",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                  onPressed: () async{
                    AddCartToFirebase.addToCart(ProductModel(id: widget.product.id, title: widget.product.title, description: widget.product.description, price: totalprice, category: widget.product.category, image: widget.product.image, rating: widget.product.rating));
                    updateCounterPrice();
                    final ScaffoldMessengerState addToCartMsg = ScaffoldMessenger.of(context);
                    addToCartMsg.showSnackBar(
                      SnackBar(
                        closeIconColor: Colors.indigo,
                        showCloseIcon: true,
                        content: Center(child: Text("${widget.product.title} added successfuly",)),
                        backgroundColor: const Color.fromARGB(255, 165, 175, 232),
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                      )
                    );

                  },
                  icon: const Icon(
                    Icons.shopping_cart, color: Colors.white, size: 15,
                  ),
                  
                  label: const Text("Add To cart", style: TextStyle(color: Colors.white, fontSize: 15)
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
