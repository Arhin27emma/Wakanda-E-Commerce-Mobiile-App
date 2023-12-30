// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:app/screens/fakestoreApi/products.dart';
import 'productItems.dart';

class ItemProducts extends StatefulWidget {
  const ItemProducts({super.key});

  @override
  State<ItemProducts> createState() => _ItemProductsState();
}

// Import statements and other code...

class _ItemProductsState extends State<ItemProducts> {
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = _getProducts();
  }

  Future<List<ProductModel>> _getProducts() async {
    try {
      final products = await Products().getProduct();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: futureProducts,
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 500,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.59
                  ),
                  
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    ProductModel productModel = snapshot.data![index];
              
                    String longDescription = productModel.description;
                    int maxLength = 20;
                    String descriptions = longDescription.length > maxLength ? "${longDescription.substring(0, maxLength)}..." : longDescription;
              
                    String longtitle = productModel.title;
                    int maxLengths = 15;
                    String title = longtitle.length > maxLengths ? "${longtitle.substring(0, maxLengths)}..." : longtitle;
                    
                    return card(
                      productModel: productModel, 
                      title: title, 
                      descriptions: descriptions,
                    );
                  },
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('ERROR: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
