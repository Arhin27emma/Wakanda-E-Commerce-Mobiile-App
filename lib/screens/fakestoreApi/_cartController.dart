import 'package:app/screens/fakestoreApi/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddCartToFirebase{

  //final ProductModel products;

  static final CollectionReference _collectionReference = FirebaseFirestore.instance.collection("carts");
  
  static Future addToCart(ProductModel products) async{
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;

    QuerySnapshot existingItems = await _collectionReference.doc(currentUser!.email).collection("items").where('id', isEqualTo: products.id).get();
    
    if(existingItems.docs.isEmpty){
      return _collectionReference.doc(currentUser.email).collection("items").doc(products.id.toString()).set(
      {
        "id":products.id,
        "title":products.title,
        "description":products.description,
        "price":products.price,
        "category":products.category,
        "image":products.image,
        "rating":products.rating,
        "counterValue": 1
      }).then((value) => print("Added to cart"));
      
    }
    else{
      print("Item already exits");
    }
    } catch (e) {
      print("$e");
    }
  }
}