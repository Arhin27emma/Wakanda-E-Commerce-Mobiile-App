import 'package:app/screens/fakestoreApi/categoryList.dart/categorylist.dart';
import 'package:flutter/material.dart';


class CatSection extends StatelessWidget {
  const CatSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Categories", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, CategoryList.routeName),
                child: const Text("See All", style: TextStyle(fontSize: 18, color: Colors.indigo),))
            ],
          ),
          //const SizedBox(height: 20,),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categories(image: "assets/images/catShoe1.png", name: "Shoes"),
                  categories(image: "assets/images/catWatch.png", name: "Watches"),
                  categories(image: "assets/images/catBag.png", name: "Bags"),
                  categories(image: "assets/images/shirt.png", name: "Shirts"),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}

// ignore: camel_case_types
class categories extends StatelessWidget {
  const categories({
    super.key, required this.image, required this.name,
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
          const SizedBox(height: 5,),
          Text(name, style: const TextStyle(fontSize: 18, color: Color(0xff4c53a5)),)
        
        ],
      ),
    );
  }
}