// ignore_for_file: unnecessary_const

import 'package:app/screens/drawer/drawer.dart';
import 'package:app/screens/fakestoreApi/items_Products.dart';
import 'package:app/screens/fakestoreApi/searchForm.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'productsSlide.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  static String routeName = "./store_screen.dart";

  @override
  State<Product> createState() => _ProductsState();
}

class _ProductsState extends State<Product> {


  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  int currentPage = 0;
  List<Map<String, dynamic>> productCatalog = [
    {
      "text": "Explore Latest",
      "description": "Affordable Products",
      "image": "assets/images/splash5.png",
      "color": Colors.red, // Use a Color object
      "width": 190.0,
    },
    {
      "text": "Popular Products",
      "description": "Products shipped",
      "image": "assets/images/splash1.png",
      "color": Colors.yellow, // Use a Color object
      "width": 170.0,
    },
    {
      "text": "Trending Products",
      "description": "Find Trends here",
      "image": "assets/images/shop2.png",
      "color": Colors.orange, // Use a Color object
      "width": 130.0,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isDrawerOpen
            ? IconButton(
                onPressed: () {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    scaleFactor = 1;
                    isDrawerOpen = false;
                  });
                },
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 25,
                color: Colors.indigo,
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    xOffset = 230;
                    yOffset = 150;
                    scaleFactor = 0.7;
                    isDrawerOpen = true;
                  });
                },
                icon: const Icon(Icons.grid_view_outlined),
                iconSize: 25,
                color: Colors.indigo,
              ),
              title: const Center(
                child: Text(
                  "Wakanda Shop",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_outlined),
                  iconSize: 25,
                  color: Colors.indigo,
                ),
              ],
      ),
      body: Stack(children: [
        const DrawerScreen(),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: const Duration(milliseconds: 250),
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 1030,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 243, 252),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      )),
                  child: Column(
                    children: [
                      const SearchForm(),
                      //const SizedBox(height: 20,),
                      slideProducts(),
                      const SizedBox(
                        height: 20,
                      ),
                      const CatSection(),
                      //const SizedBox(height: 20,),
                      const Text(
                        "Best Selling Products",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ItemProducts()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],),
    );
  }

  Expanded slideProducts() {
    return Expanded(
      child: PageView.builder(
        itemCount: productCatalog.length,
        onPageChanged: (index) => setState(() {
          currentPage = index;
        }),
        itemBuilder: (context, index) => productContainer(
          text: productCatalog[index]["text"] ?? "",
          description: productCatalog[index]["description"] ?? "",
          image: productCatalog[index]["image"] ?? "",
          color: productCatalog[index]["color"],
          widths: productCatalog[index]["width"] ?? "",
        ),
      ),
    );
  }
}
