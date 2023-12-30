import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });
  static String routeName = "categorylist.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CATEGORIES",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ),
      body: const SafeArea(
      
          
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(image: "assets/images/catShoe1.png", name: "Shoes"),
                  categories(image: "assets/images/catWatch.png", name: "Watches"),
                  categories(image: "assets/images/pomade.jpg", name: "Pomade"),
                
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(image: "assets/images/shirt.png", name: "Shirts"),
                  categories(image: "assets/images/phone.jpg", name: "Phones"),
                  categories(image: "assets/images/key.jpg", name: "Key"),
                  
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(image: "assets/images/bulb.jpg", name: "Bulb"),
                  categories(
                      image: "assets/images/catBag.png", name: "Bags"),
                  categories(image: "assets/images/spray.jpeg", name: "Spray"),
                
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categories(image: "assets/images/jewelry.jpg", name: "Jewelries"),
                  categories(image: "assets/images/plate.jpg", name: "Plates"),
                  categories(image: "assets/images/laptop.jpeg", name: "Laptops"),
                 
                ],
              ),
              SizedBox(
                height: 50,
              ),
              
                
            ],
          ),
        ),
    );
  }
}

// ignore: camel_case_types
class categories extends StatelessWidget {
  const categories({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Color(0xff4c53a5)),
          )
        ],
      ),
    );
  }
}
