
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PriceState{
  static int _increments = 1;
  static int _decrements = 0;
  static double _totalprice = 0.0;
  static double _sum = 0.0;

  int get increments => _increments;
  int get decrements => _decrements;
  double get totalprice => _totalprice;
  double get sum => _sum;


  static void increment(){
    _increments++;
    updateQuantity();
    calculateTotalPrice();
  }

  static void decrement(){
    if(_increments > 1){
      _decrements--;
      updateQuantity();
      calculateTotalPrice();
    }
  }


  static Future<void> updateQuantity() async{
    await FirebaseFirestore.instance.collection("counter").doc(FirebaseAuth.instance.currentUser!.email).update({
      'IncreaseQuantity': _increments,
      'DecreaseQuantity':_decrements,
    }).then((value) => print("value updated: $_increments, $_decrements"));
  }

  static Future calculateTotalPrice() async{

    DocumentSnapshot productData = await FirebaseFirestore.instance.collection("carts").doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc().get();

    double price = productData['price'];
    _totalprice = price * (_increments - _decrements);

    await FirebaseFirestore.instance
        .collection("carts")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc(productData.id)
        .update({
          'price': _totalprice
        }).then((value) => print("Price updated: $_totalprice"));

  }
}