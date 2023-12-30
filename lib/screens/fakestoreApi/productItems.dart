// ignore_for_file: file_names, camel_case_types

import 'package:app/screens/fakestoreApi/productDetails.dart';
import 'package:flutter/material.dart';
import 'products.dart';


class card extends StatelessWidget {
  const card({
    super.key,
    required this.productModel,
    required this.title,
    required this.descriptions, 
  });

  final ProductModel productModel;
  final String title;
  final String descriptions;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => productDetails(product: productModel,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "-50%",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ],
              ),
              InkWell(
                //onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  child: Image.network(productModel.image, width: 100, height: 100,),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Title(
                  color: Colors.indigo, 
                  child: Text(title,
                  style: const TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              ),
              Text(
                descriptions,
                style: const TextStyle(fontSize: 15, color: Colors.indigo),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "GHC ${productModel.price}", 
                      style: const TextStyle(color: Colors.indigo, fontSize: 15, fontWeight: FontWeight.bold),),
                  ),
                  const Icon(Icons.shopping_cart, color: Colors.red,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
